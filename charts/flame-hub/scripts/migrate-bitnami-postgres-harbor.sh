#!/usr/bin/env bash
# Migrate flame-hub PostgreSQL (Bitnami) and Harbor (Bitnami) to CloudNativePG + goharbor.
#
# Usage:
#   ./migrate-bitnami-postgres-harbor.sh [release] [namespace] [values-file]
#
# Example:
#   ./migrate-bitnami-postgres-harbor.sh hub default charts/flame-hub/values_local.yaml
set -euo pipefail

RELEASE="${1:-hub}"
NAMESPACE="${2:-default}"
VALUES_FILE="${3:-charts/flame-hub/values_local.yaml}"
CHART_DIR="charts/flame-hub"
BACKUP_DIR="${BACKUP_DIR:-/tmp/flame-hub-migration-$(date +%Y%m%d-%H%M%S)}"
PG_HOST="${RELEASE}-postgresql-primary"
AUTH_SECRET="${AUTH_SECRET:-flame-hub-auth}"

log() { printf '[migrate] %s\n' "$*"; }
die() { printf '[migrate] ERROR: %s\n' "$*" >&2; exit 1; }

command -v kubectl >/dev/null || die "kubectl required"
command -v helm >/dev/null || die "helm required"
[[ -f "$VALUES_FILE" ]] || die "values file not found: $VALUES_FILE"

mkdir -p "$BACKUP_DIR"
log "Backups will be written to $BACKUP_DIR"

log "Step 1/7: pg_dumpall backup from Bitnami PostgreSQL"
if kubectl get pod -n "$NAMESPACE" "${RELEASE}-postgresql-primary-0" >/dev/null 2>&1; then
  PG_PASS="$(kubectl get secret -n "$NAMESPACE" "$AUTH_SECRET" -o jsonpath='{.data.postgresql-password}' | base64 -d)"
  kubectl exec -n "$NAMESPACE" "${RELEASE}-postgresql-primary-0" -- \
    env PGPASSWORD="$PG_PASS" pg_dumpall -U postgres -h localhost \
    > "${BACKUP_DIR}/pg_dumpall.sql"
  log "Backup saved to ${BACKUP_DIR}/pg_dumpall.sql ($(wc -c < "${BACKUP_DIR}/pg_dumpall.sql") bytes)"
else
  log "Bitnami PostgreSQL pod not found; skipping live backup (fresh install or already migrated?)"
fi

log "Step 2/7: Install CloudNativePG operator (if missing)"
if ! kubectl get crd clusters.postgresql.cnpg.io >/dev/null 2>&1; then
  helm repo add cnpg https://cloudnative-pg.github.io/charts 2>/dev/null || true
  helm repo update cnpg
  helm upgrade --install cnpg cnpg/cloudnative-pg \
    --namespace cnpg-system \
    --create-namespace \
    --wait \
    --timeout 10m
  kubectl wait --for=condition=Established crd/clusters.postgresql.cnpg.io --timeout=120s
else
  log "CNPG operator already installed"
fi

log "Step 3/7: helm dependency update"
helm repo add harbor https://helm.goharbor.io 2>/dev/null || true
helm repo update harbor cnpg
helm dependency update "$CHART_DIR"

STEADY_VALUES="${BACKUP_DIR}/steady-state-values.yaml"
cat > "$STEADY_VALUES" <<EOF
postgresql:
  migration:
    enabled: false
harbor:
  database:
    external:
      host: ${PG_HOST}
  expose:
    clusterIP:
      name: ${RELEASE}-harbor
  persistence:
    persistentVolumeClaim:
      registry:
        existingClaim: ${RELEASE}-harbor-registry
      jobservice:
        jobLog:
          existingClaim: ${RELEASE}-harbor-jobservice
      trivy:
        existingClaim: data-${RELEASE}-harbor-trivy-0
EOF

log "Step 4/7: Scale down Harbor workloads to release DB connections"
for deploy in harbor-core harbor-jobservice harbor-portal harbor-registry harbor-nginx; do
  if kubectl get deployment -n "$NAMESPACE" "${RELEASE}-${deploy}" >/dev/null 2>&1; then
    kubectl scale deployment -n "$NAMESPACE" "${RELEASE}-${deploy}" --replicas=0 || true
  fi
done
if kubectl get statefulset -n "$NAMESPACE" "${RELEASE}-harbor-trivy" >/dev/null 2>&1; then
  kubectl scale statefulset -n "$NAMESPACE" "${RELEASE}-harbor-trivy" --replicas=0 || true
fi
if kubectl get statefulset -n "$NAMESPACE" "${RELEASE}-harbor-redis" >/dev/null 2>&1; then
  kubectl scale statefulset -n "$NAMESPACE" "${RELEASE}-harbor-redis" --replicas=0 || true
fi

log "Step 5/7: Remove legacy Harbor Deployments/StatefulSets (selectors are incompatible with goharbor)"
kubectl delete deployment -n "$NAMESPACE" \
  "${RELEASE}-harbor-core" "${RELEASE}-harbor-jobservice" "${RELEASE}-harbor-portal" \
  "${RELEASE}-harbor-registry" "${RELEASE}-harbor-nginx" \
  --ignore-not-found --wait=true
kubectl delete statefulset -n "$NAMESPACE" \
  "${RELEASE}-harbor-trivy" "${RELEASE}-harbor-redis" "${RELEASE}-harbor-redis-master" \
  --ignore-not-found --wait=true

log "Removing legacy Bitnami PostgreSQL before CNPG takes over ${PG_HOST}"
kubectl delete statefulset -n "$NAMESPACE" "${RELEASE}-postgresql-primary" --ignore-not-found --wait=true

log "Step 6/7: helm upgrade (CNPG initdb + goharbor)"
helm upgrade "$RELEASE" "$CHART_DIR" \
  -n "$NAMESPACE" \
  -f "$VALUES_FILE" \
  -f "$STEADY_VALUES" \
  --wait \
  --timeout 30m

log "Waiting for CNPG cluster to become ready"
kubectl wait --for=condition=Ready "cluster/${RELEASE}-postgresql" -n "$NAMESPACE" --timeout=20m

if [[ -f "${BACKUP_DIR}/pg_dumpall.sql" ]]; then
  log "Step 7/7: Restore pg_dumpall into CNPG"
  CNPG_POD="$(kubectl get pods -n "$NAMESPACE" -l "cnpg.io/cluster=${RELEASE}-postgresql,role=primary" -o jsonpath='{.items[0].metadata.name}')"
  PG_PASS="$(kubectl get secret -n "$NAMESPACE" "$AUTH_SECRET" -o jsonpath='{.data.postgresql-password}' | base64 -d)"
  kubectl exec -i -n "$NAMESPACE" "$CNPG_POD" -- \
    env PGPASSWORD="$PG_PASS" psql -U postgres -h localhost -v ON_ERROR_STOP=0 -f - \
    < "${BACKUP_DIR}/pg_dumpall.sql"
  log "Restore complete"
else
  log "Step 7/7: skipped (no backup file)"
fi

log "Migration complete."
log "Backup: ${BACKUP_DIR}/pg_dumpall.sql"
log "Verify: kubectl get pods -n ${NAMESPACE} | grep -E 'postgresql|harbor'"
