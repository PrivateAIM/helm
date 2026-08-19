{{/*
core publicURL
*/}}
{{- define "serverCore.publicURL" -}}
{{- $prefix := "http" -}}
{{- if or .Values.serverCore.publicHttps .Values.global.flameHub.publicHttps -}}
  {{- $prefix = "https" -}}
{{- end -}}
{{- $hostname := "" -}}
{{- $path := "" -}}
{{- if .Values.serverCore.ingress.enabled -}}
  {{- $hostname = .Values.serverCore.ingress.hostname -}}
  {{- $path = .Values.serverCore.ingress.path | default "/" -}}
{{- else if .Values.global.flameHub.ingress.enabled -}}
  {{- $hostname = .Values.global.flameHub.ingress.hostname -}}
  {{- $path = "/core/" -}}
{{- else if or .Values.serverCore.gatewayApi.enabled .Values.global.flameHub.gatewayApi.enabled -}}
  {{- $hostname = .Values.serverCore.gatewayApi.hostname | default .Values.global.flameHub.gatewayApi.hostname -}}
  {{- $path = .Values.serverCore.gatewayApi.path | default "/" -}}
{{- end -}}
{{- if $hostname -}}
{{- printf "%s://%s%s" $prefix $hostname $path | trimSuffix "/" | printf "%s/" -}}
{{- else -}}
{{- fail "Hostname for serverCore is not defined!" -}}
{{- end -}}
{{- end -}}

{{/*
storage publicURL
*/}}
{{- define "serverStorage.publicURL" -}}
{{- $prefix := "http" -}}
{{- if or .Values.serverStorage.publicHttps .Values.global.flameHub.publicHttps -}}
  {{- $prefix = "https" -}}
{{- end -}}
{{- $hostname := "" -}}
{{- $path := "" -}}
{{- if .Values.serverStorage.ingress.enabled -}}
  {{- $hostname = .Values.serverStorage.ingress.hostname -}}
  {{- $path = .Values.serverStorage.ingress.path | default "/" -}}
{{- else if .Values.global.flameHub.ingress.enabled -}}
  {{- $hostname = .Values.global.flameHub.ingress.hostname -}}
  {{- $path = "/storage/" -}}
{{- else if or .Values.serverStorage.gatewayApi.enabled .Values.global.flameHub.gatewayApi.enabled -}}
  {{- $hostname = .Values.serverStorage.gatewayApi.hostname | default .Values.global.flameHub.gatewayApi.hostname -}}
  {{- $path = .Values.serverStorage.gatewayApi.path | default "/" -}}
{{- end -}}
{{- if $hostname -}}
{{- printf "%s://%s%s" $prefix $hostname $path | trimSuffix "/" | printf "%s/" -}}
{{- else -}}
{{- fail "Hostname for serverStorage is not defined!" -}}
{{- end -}}
{{- end -}}

{{/*
telemetry publicURL
*/}}
{{- define "serverTelemetry.publicURL" -}}
{{- $prefix := "http" -}}
{{- if or .Values.serverTelemetry.publicHttps .Values.global.flameHub.publicHttps -}}
  {{- $prefix = "https" -}}
{{- end -}}
{{- $hostname := "" -}}
{{- $path := "" -}}
{{- if .Values.serverTelemetry.ingress.enabled -}}
  {{- $hostname = .Values.serverTelemetry.ingress.hostname -}}
  {{- $path = .Values.serverTelemetry.ingress.path | default "/" -}}
{{- else if .Values.global.flameHub.ingress.enabled -}}
  {{- $hostname = .Values.global.flameHub.ingress.hostname -}}
  {{- $path = "/telemetry/" -}}
{{- else if or .Values.serverTelemetry.gatewayApi.enabled .Values.global.flameHub.gatewayApi.enabled -}}
  {{- $hostname = .Values.serverTelemetry.gatewayApi.hostname | default .Values.global.flameHub.gatewayApi.hostname -}}
  {{- $path = .Values.serverTelemetry.gatewayApi.path | default "/" -}}
{{- end -}}
{{- if $hostname -}}
{{- printf "%s://%s%s" $prefix $hostname $path | trimSuffix "/" | printf "%s/" -}}
{{- else -}}
{{- fail "Hostname for serverTelemetry is not defined!" -}}
{{- end -}}
{{- end -}}

{{/*
clientUI hostname / ui domain
*/}}
{{- define "flameHub.uiDomain" -}}
{{- $hostname := "" -}}
{{- if hasKey .Values "clientUI" -}}
  {{- if .Values.clientUI.ingress.enabled -}}
    {{- $hostname = .Values.clientUI.ingress.hostname -}}
  {{- else if .Values.global.flameHub.ingress.enabled -}}
    {{- $hostname = .Values.global.flameHub.ingress.hostname -}}
  {{- else if or .Values.clientUI.gatewayApi.enabled .Values.global.flameHub.gatewayApi.enabled -}}
    {{- $hostname = .Values.clientUI.gatewayApi.hostname | default .Values.global.flameHub.gatewayApi.hostname -}}
  {{- end -}}
{{- else -}}
  {{- if .Values.global.flameHub.ingress.enabled -}}
    {{- $hostname = .Values.global.flameHub.ingress.hostname -}}
  {{- else if .Values.global.flameHub.gatewayApi.enabled -}}
    {{- $hostname = .Values.global.flameHub.gatewayApi.hostname -}}
  {{- end -}}
{{- end -}}
{{- if $hostname -}}
{{- $hostname -}}
{{- else -}}
{{- fail "Hostname for UI domain is not defined!" -}}
{{- end -}}
{{- end -}}

{{/*
authup publicURL.

Named under flameHub.* rather than authup.*: the authup.* template namespace now
belongs to the subchart, and Helm compiles every chart's templates into one shared
namespace, so a same-named upstream helper would silently win.

Callable from this chart AND from a tpl-rendered value inside the authup subchart -
that is how values.yaml sets authup.server.publicUrl. Hence the routing knobs live
under global.flameHub.authup (a subchart sees only `global`), and the subchart's own
ingress is read from whichever side is in scope.
*/}}
{{- define "flameHub.authup.publicURL" -}}
{{- $authup := .Values.global.flameHub.authup -}}
{{- $ingress := dict -}}
{{- if hasKey .Values "authup" -}}
  {{- $ingress = .Values.authup.server.ingress -}}
{{- else -}}
  {{- $ingress = .Values.server.ingress -}}
{{- end -}}
{{- $prefix := "http" -}}
{{- if or $authup.publicHttps .Values.global.flameHub.publicHttps -}}
  {{- $prefix = "https" -}}
{{- end -}}
{{- $hostname := "" -}}
{{- $path := "" -}}
{{- if $ingress.enabled -}}
  {{- $hostname = $ingress.hostname -}}
  {{- $path = $ingress.path | default "/" -}}
{{- else if .Values.global.flameHub.ingress.enabled -}}
  {{- $hostname = .Values.global.flameHub.ingress.hostname -}}
  {{- $path = "/auth/" -}}
{{- else if or $authup.gatewayApi.enabled .Values.global.flameHub.gatewayApi.enabled -}}
  {{- $hostname = $authup.gatewayApi.hostname | default .Values.global.flameHub.gatewayApi.hostname -}}
  {{- $path = $authup.gatewayApi.path | default "/" -}}
{{- end -}}
{{- if $hostname -}}
{{- printf "%s://%s%s" $prefix $hostname $path | trimSuffix "/" | printf "%s/" -}}
{{- else -}}
{{- fail "Hostname for authup is not defined!" -}}
{{- end -}}
{{- end -}}

{{/*
Harbor host
*/}}
{{- define "harbor.host" -}}
{{- if .Values.harbor.externalURL -}}
{{- $parsedURL := urlParse .Values.harbor.externalURL -}}
{{- if $parsedURL.host -}}
{{- $parsedURL.host -}}
{{- else -}}
{{- fail "Hostname for harbor.externalURL could not be parsed! Ensure it includes a scheme like https://" -}}
{{- end -}}
{{- else -}}
{{- if .Values.externalHarbor.URL -}}
{{ .Values.externalHarbor.URL }}
{{- end -}}
{{- end -}}
{{- end }}

{{/*
Harbor baseURL (scheme + host, no trailing slash)
*/}}
{{- define "harbor.baseURL" -}}
{{- if .Values.harbor.externalURL -}}
{{- trimSuffix "/" .Values.harbor.externalURL -}}
{{- else -}}
{{- trimSuffix "/" .Values.externalHarbor.URL -}}
{{- end -}}
{{- end }}


{{/*
Harbor internalHost (host, no trailing slash)
This is used by pods to access harbor. If ExternalHarbor is used, this will be the external harbor host.
*/}}
{{- define "harbor.internalHost" -}}
{{- if .Values.externalHarbor.enabled -}}
{{ include "harbor.host" . }}
{{- else -}}
{{- if .Values.harbor.enabled -}}
{{- $exposeType := .Values.harbor.expose.type | default "clusterIP" -}}
{{- if ne $exposeType "clusterIP" -}}
{{- fail (printf "harbor.expose.type=%q is not supported by this chart: harbor.internalHost (used by the wait-for-harbor init container and in-cluster access) only resolves the clusterIP Service. Set harbor.expose.type=clusterIP, or use externalHarbor." $exposeType) -}}
{{- end -}}
{{- .Values.harbor.expose.clusterIP.name | default "harbor" -}}
{{- end }}
{{- end }}
{{- end }}
