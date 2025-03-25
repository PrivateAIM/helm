{{/*
Defines the databse type
*/}}
{{- define "db.type" -}}
{{ .Values.db.type }}
{{- end }}

{{/*
Defines the databse host
*/}}
{{- define "db.mysql.host" -}}
{{- if .Values.db.mysql.useExternal }}
{{ .Values.db.mysql.externalServer }}
{{- else }}
{{ .Release.Name }}-mysql-primary
{{- end }}
{{- end }}

{{/*
Defines the databse host
*/}}
{{- define "db.pgsql.host" -}}
{{- if .Values.db.pgsql.useExternal }}
{{ .Values.db.pgsql.externalServer }}
{{- else }}
{{ .Release.Name }}-pgsql-primary
{{- end }}
{{- end }}

{{/*
Defines the databse host
*/}}
{{- define "db.host" -}}
{{- if eq (include "db.type" .) "mysql" }}
{{ include "db.mysql.host" . }}
{{- else }}
{{ include "db.pgsql.host" . }}
{{- end }}
{{- end }}

{{/*
Defines the databse user
*/}}
{{- define "db.user" -}}
{{- if eq (include "db.type" .) "mysql" }}
{{ .Values.db.mysql.username }}
{{- else }}
{{ .Values.db.pgsql.username }}
{{- end }}
{{- end }}

{{/*
Defines the databse password
*/}}
{{- define "db.password" -}}
{{- if eq (include "db.type" .) "mysql" }}
{{ .Values.db.mysql.password }}
{{- else }}
{{ .Values.db.pgsql.password }}
{{- end }}
{{- end }}

{{/*
Defines the databse name
*/}}
{{- define "db.database" -}}
{{- if eq (include "db.type" .) "mysql" }}
{{ .Values.db.mysql.database }}
{{- else }}
{{ .Values.db.pgsql.database }}
{{- end }}
{{- end }}