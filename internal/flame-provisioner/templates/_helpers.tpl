{{/* Common labels for the internal provisioning hooks. */}}
{{- define "flame-provisioner.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: provisioning
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
flame.privateaim.dev/chart-version: {{ .Chart.Version | replace "+" "_" | quote }}
flame.privateaim.dev/seeder-version: {{ .Chart.AppVersion | replace "+" "_" | quote }}
flame.privateaim.dev/provisioning-mode: {{ .Values.mode | quote }}
{{- end }}

{{- define "flame-provisioner.hookAnnotations" -}}
helm.sh/hook: post-install,post-upgrade
helm.sh/hook-delete-policy: before-hook-creation
{{- end }}

{{- define "flame-provisioner.waitForHub" -}}
- name: wait-for-hub
  image: {{ required "waitForHub.image is required" .Values.waitForHub.image | quote }}
  command: ["sh", "-c"]
  args:
    - |
      echo "Waiting for hub core API..."
      until curl -skf {{ required "hub.url is required" .Values.hub.url | quote }}; do
        echo "  ...not ready, retrying in 5s"
        sleep 5
      done
      echo "Hub core API is reachable!"
{{- end }}

{{- define "flame-provisioner.seederEnv" -}}
- name: HUB_URL
  value: {{ required "hub.url is required" .Values.hub.url | quote }}
- name: AUTHUP_URL
  value: {{ required "hub.authupUrl is required" .Values.hub.authupUrl | quote }}
- name: CLIENT_ID
  value: {{ required "hub.auth.clientId is required" .Values.hub.auth.clientId | quote }}
- name: CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ required "hub.auth.clientSecret.name is required" .Values.hub.auth.clientSecret.name | quote }}
      key: {{ required "hub.auth.clientSecret.key is required" .Values.hub.auth.clientSecret.key | quote }}
- name: REALM
  value: {{ required "hub.realm is required" .Values.hub.realm | quote }}
{{- end }}
