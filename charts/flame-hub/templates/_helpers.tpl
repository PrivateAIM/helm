{{/*
Expand the name of the chart.
*/}}
{{- define "flame-hub.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "flame-hub.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "flame-hub.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "flame-hub.labels" -}}
helm.sh/chart: {{ include "flame-hub.chart" . }}
{{ include "flame-hub.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "flame-hub.selectorLabels" -}}
app.kubernetes.io/name: {{ include "flame-hub.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "flame-hub.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "flame-hub.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "flameHub.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{- define "flameHub.effectiveSecretName" -}}
{{- if .Values.auth.existingSecret -}}
{{ .Values.auth.existingSecret }}
{{- else -}}
{{ .Values.auth.secretName }}
{{- end -}}
{{- end -}}

{{/*
Validate ingress mode: global path-based ingress and individual service ingresses are mutually exclusive.
*/}}
{{- define "flameHub.validateIngressMode" -}}
{{- $globalIngressEnabled := .Values.global.flameHub.ingress.enabled -}}
{{- $individualIngressEnabled := or
    .Values.clientUI.ingress.enabled
    .Values.serverCore.ingress.enabled
    .Values.serverMessenger.ingress.enabled
    .Values.serverStorage.ingress.enabled
    .Values.serverTelemetry.ingress.enabled
    .Values.authup.ingress.enabled
-}}
{{- if and $globalIngressEnabled $individualIngressEnabled -}}
{{- fail "Ingress configuration is mutually exclusive: disable global.flameHub.ingress.enabled or disable individual service ingress settings (clientUI, serverCore, serverMessenger, serverStorage, serverTelemetry, authup)." -}}
{{- end -}}
{{- end -}}

{{/*
Generate a pair of HTTP (+ optional HTTPS) gateway listeners for a given name and hostname.
Expects a dict with keys: name, hostname, tls (the global TLS config dict).
*/}}
{{- define "flameHub.gatewayListeners" -}}
- name: {{ .name }}-http
  hostname: {{ .hostname | quote }}
  protocol: HTTP
  port: 80
  allowedRoutes:
    namespaces:
      from: Same
{{- if .tls.enabled }}
- name: {{ .name }}-https
  hostname: {{ .hostname | quote }}
  protocol: HTTPS
  port: 443
  tls:
    mode: {{ .tls.mode | default "Terminate" }}
    certificateRefs:
      - name: {{ .tls.certificateRef }}
  allowedRoutes:
    namespaces:
      from: Same
{{- end }}
{{- end -}}