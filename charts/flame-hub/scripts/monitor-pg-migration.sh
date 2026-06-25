#!/usr/bin/env bash
# Snapshot PostgreSQL databases and table row counts for migration verification.
#
# Usage:
#   ./monitor-pg-migration.sh <phase> [release] [namespace] [output-dir]
#   ./monitor-pg-migration.sh compare <before-snapshot> <after-snapshot>
#
# Phases: baseline | post-upgrade | post-restore | verify
# Writes ${output-dir}/${phase}-pg-snapshot.txt and appends a one-line summary to migration-log.tsv
set -euo pipefail

if [[ "${1:-}" == "compare" ]]; then
  BEFORE="${2:?before snapshot path}"
  AFTER="${3:?after snapshot path}"
  echo "Comparing non-zero table counts:"
  diff -u \
    <(grep -E '^(auth|core|registry|storage|telemetry)\.' "$BEFORE" | sort) \
    <(grep -E '^(auth|core|registry|storage|telemetry)\.' "$AFTER" | sort) \
    && echo "No differences in non-zero table counts."
  exit 0
fi

PHASE="${1:?phase required (baseline|post-upgrade|post-restore|verify|custom)}"
RELEASE="${2:-flame-hub}"
NAMESPACE="${3:-default}"
OUTPUT_DIR="${4:-/tmp/flame-hub-migration-monitor}"
AUTH_SECRET="${AUTH_SECRET:-flame-hub-auth}"
EXPECTED_DBS=(auth core registry storage telemetry)
LOG_FILE="${OUTPUT_DIR}/migration-log.tsv"

mkdir -p "$OUTPUT_DIR"
SNAPSHOT="${OUTPUT_DIR}/${PHASE}-pg-snapshot.txt"

log() { printf '[monitor:%s] %s\n' "$PHASE" "$*"; }

get_pg_pass() {
  kubectl get secret -n "$NAMESPACE" "$AUTH_SECRET" -o jsonpath='{.data.postgresql-password}' | base64 -d
}

find_pg_pod() {
  local pod=""
  if pod="$(kubectl get pod -n "$NAMESPACE" "${RELEASE}-postgresql-primary-0" -o jsonpath='{.metadata.name}' 2>/dev/null)" && [[ -n "$pod" ]]; then
    printf '%s\n' "$pod"
    return 0
  fi
  pod="$(kubectl get pods -n "$NAMESPACE" -l "cnpg.io/cluster=${RELEASE}-postgresql,role=primary" -o jsonpath='{.items[0].metadata.name}' 2>/dev/null || true)"
  if [[ -n "$pod" ]]; then
    printf '%s\n' "$pod"
    return 0
  fi
  return 1
}

run_psql() {
  local pod="$1"
  shift
  local pass
  pass="$(get_pg_pass)"
  kubectl exec -n "$NAMESPACE" "$pod" -- env PGPASSWORD="$pass" psql -U postgres -h localhost "$@"
}

POD=""
if ! POD="$(find_pg_pod)"; then
  printf 'ERROR: no PostgreSQL pod found (Bitnami or CNPG)\n' | tee "$SNAPSHOT"
  exit 1
fi

{
  printf '=== PG migration snapshot: %s ===\n' "$PHASE"
  printf 'timestamp: %s\n' "$(date -Is)"
  printf 'release: %s namespace: %s\n' "$RELEASE" "$NAMESPACE"
  printf 'pod: %s\n\n' "$POD"

  printf '%s\n' '--- databases ---'
  run_psql "$POD" -Atc \
    "SELECT datname || E'\t' || pg_size_pretty(pg_database_size(datname)) FROM pg_database WHERE datistemplate=false ORDER BY datname;"

  printf '%s\n' '--- expected databases present ---'
  for db in "${EXPECTED_DBS[@]}"; do
    if run_psql "$POD" -Atc "SELECT 1 FROM pg_database WHERE datname='${db}'" | grep -q 1; then
      printf 'OK\t%s\n' "$db"
    else
      printf 'MISSING\t%s\n' "$db"
    fi
  done

  printf '%s\n' '--- table row counts ---'
  for db in "${EXPECTED_DBS[@]}" postgres; do
    if ! run_psql "$POD" -Atc "SELECT 1 FROM pg_database WHERE datname='${db}'" | grep -q 1; then
      printf '== %s == MISSING DATABASE\n' "$db"
      continue
    fi
    printf '== %s ==\n' "$db"
    run_psql "$POD" -d "$db" -Atc \
      "SELECT schemaname||'.'||relname||E'\t'||COALESCE(n_live_tup::text,'?') FROM pg_stat_user_tables ORDER BY schemaname, relname;" \
      2>/dev/null || printf '(unable to query tables)\n'
  done

  printf '%s\n' '--- non-zero tables only ---'
  for db in "${EXPECTED_DBS[@]}"; do
    run_psql "$POD" -d "$db" -Atc \
      "SELECT '${db}.'||schemaname||'.'||relname||E'\t'||n_live_tup FROM pg_stat_user_tables WHERE n_live_tup > 0 ORDER BY n_live_tup DESC;" \
      2>/dev/null || true
  done
} | tee "$SNAPSHOT"

# One-line summary for diffing across phases
db_count="$(grep -E '^[^-]' "$SNAPSHOT" | awk -F'\t' '/^auth\t|^core\t|^registry\t|^storage\t|^telemetry\t/{c++} END{print c+0}')"
nonzero="$(grep -c $'\t' "$SNAPSHOT" || true)"
printf '%s\t%s\t%s\t%s\t%s\n' "$(date -Is)" "$PHASE" "$POD" "${db_count:-0}" "$SNAPSHOT" >> "$LOG_FILE"

log "Wrote $SNAPSHOT"
log "Appended summary to $LOG_FILE"
