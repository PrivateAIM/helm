{{/*
core publicURL
*/}}
{{- define "core.publicURL" -}}
{{- if .Values.core.hostname }}
{{- if .Values.core.ssl }}
https://{{- .Values.core.hostname }}
{{- else }}
http://{{- .Values.core.hostname }}
{{- end }}
{{- else }}
{{- if .Values.core.ssl }}
https://{{ .Values.global.hub.hostname }}/core/
{{- else }}
http://{{ .Values.global.hub.hostname }}/core/
{{- end }}
{{- end }}
{{- end }}

{{/*
storage publicURL
*/}}
{{- define "storage.publicURL" -}}
{{- if .Values.storage.hostname }}
{{- if .Values.storage.ssl }}
https://{{- .Values.storage.hostname }}
{{- else }}
http://{{- .Values.storage.hostname }}
{{- end }}
{{- else }}
{{- if .Values.global.hub.ssl }}
https://{{ .Values.global.hub.hostname }}/storage/
{{- else }}
http://{{ .Values.global.hub.hostname }}/storage/
{{- end }}
{{- end }}
{{- end }}

{{/*
authup publicURL
*/}}
{{- define "authup.publicURL" -}}
{{- if .Values.authup.hostname }}
{{- if .Values.authup.ssl }}
https://{{- .Values.authup.hostname }}
{{- else }}
http://{{- .Values.authup.hostname }}
{{- end }}
{{- else }}
{{- if .Values.global.hub.ssl }}
https://{{ .Values.global.hub.hostname }}/auth/
{{- else }}
http://{{ .Values.global.hub.hostname }}/auth/
{{- end }}
{{- end }}
{{- end }}