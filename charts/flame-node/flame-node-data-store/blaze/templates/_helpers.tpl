{{/*
Expand the name of the chart.
*/}}
{{- define "blaze.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "blaze.fullname" -}}
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
{{- define "blaze.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "blaze.labels" -}}
helm.sh/chart: {{ include "blaze.chart" . }}
{{ include "blaze.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "blaze.selectorLabels" -}}
app.kubernetes.io/name: {{ include "blaze.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "blaze.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "blaze.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the FHIR base URL.
If .Values.dataPopulatorJob.env.FHIR_BASE_URL is provided, use that.
Otherwise, create the default URL using blaze service.
*/}}
{{- define "blaze.fhirBaseURL" -}}
{{- if .Values.dataPopulatorJob.env.FHIR_BASE_URL -}}
{{- .Values.dataPopulatorJob.env.FHIR_BASE_URL -}}
{{- else -}}
{{- $fullname := include "blaze.fullname" . -}}
{{- $port := int .Values.service.port -}}
{{- printf "http://%s:%d/fhir" $fullname $port -}}
{{- end -}}
{{- end }}