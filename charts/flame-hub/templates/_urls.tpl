{{/*
core publicURL
*/}}
{{- define "serverCore.publicURL" -}}
{{- if .Values.serverCore.ingress.hostname }}
{{- if .Values.serverCore.ingress.ssl }}
https://{{- .Values.serverCore.ingress.hostname }}
{{- else }}
http://{{- .Values.serverCore.ingress.hostname }}
{{- end }}
{{- else }}
{{- if .Values.global.flameHub.ingress.ssl }}
https://{{ .Values.global.flameHub.ingress.hostname }}/core/
{{- else }}
http://{{ .Values.global.flameHub.ingress.hostname }}/core/
{{- end }}
{{- end }}
{{- end }}

{{/*
storage publicURL
*/}}
{{- define "serverStorage.publicURL" -}}
{{- if .Values.serverStorage.ingress.hostname }}
{{- if .Values.serverStorage.ingress.ssl }}
https://{{- .Values.serverStorage.ingress.hostname }}
{{- else }}
http://{{- .Values.serverStorage.ingress.hostname }}
{{- end }}
{{- else }}
{{- if .Values.global.flameHub.ingress.ssl }}
https://{{ .Values.global.flameHub.ingress.hostname }}/storage/
{{- else }}
http://{{ .Values.global.flameHub.ingress.hostname }}/storage/
{{- end }}
{{- end }}
{{- end }}

{{/*
telemetry publicURL
*/}}
{{- define "serverTelemetry.publicURL" -}}
{{- if .Values.serverTelemetry.ingress.hostname }}
{{- if .Values.serverTelemetry.ingress.ssl }}
https://{{- .Values.serverTelemetry.ingress.hostname }}
{{- else }}
http://{{- .Values.serverTelemetry.ingress.hostname }}
{{- end }}
{{- else }}
{{- if .Values.global.flameHub.ingress.ssl }}
https://{{ .Values.global.flameHub.ingress.hostname }}/telemetry/
{{- else }}
http://{{ .Values.global.flameHub.ingress.hostname }}/telemetry/
{{- end }}
{{- end }}
{{- end }}

{{/*
authup publicURL
*/}}
{{- define "authup.publicURL" -}}
{{- if .Values.authup.ingress.hostname }}
{{- if .Values.authup.ingress.ssl }}
https://{{- .Values.authup.ingress.hostname }}
{{- else }}
http://{{- .Values.authup.ingress.hostname }}
{{- end }}
{{- else }}
{{- if .Values.global.flameHub.ingress.ssl }}
https://{{ .Values.global.flameHub.ingress.hostname }}/auth/
{{- else }}
http://{{ .Values.global.flameHub.ingress.hostname }}/auth/
{{- end }}
{{- end }}
{{- end }}