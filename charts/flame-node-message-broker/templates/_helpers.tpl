{{/*
Return hub auth API endpoint
*/}}
{{- define "broker.hub.authApi" -}}
{{- if .Values.global.hub.endpoints.auth -}}
    {{- .Values.global.hub.endpoints.auth -}}
{{- else -}}
    {{- .Values.hub.endpoints.auth -}}
{{- end -}}
{{- end -}}

{{/*
Return hub core API endpoint
*/}}
{{- define "broker.hub.coreApi" -}}
{{- if .Values.global.hub.endpoints.core -}}
    {{- .Values.global.hub.endpoints.core -}}
{{- else -}}
    {{- .Values.hub.endpoints.core -}}
{{- end -}}
{{- end -}}

{{/*
Return hub messenger API endpoint
*/}}
{{- define "broker.hub.messengerApi" -}}
{{- if .Values.global.hub.endpoints.messenger -}}
    {{- .Values.global.hub.endpoints.messenger -}}
{{- else -}}
    {{- .Values.hub.endpoints.messenger -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the hub robot secret
*/}}
{{- define "broker.hub.secretName" -}}
{{- $globalRobotSecretName := .Values.global.hub.auth.existingSecret -}}
{{- $robotSecretName := .Values.hub.auth.existingSecret -}}
{{- if $globalRobotSecretName -}}
    {{- printf "%s" (tpl $globalRobotSecretName $) -}}
{{- else if $robotSecretName -}}
    {{- printf "%s" (tpl $robotSecretName $) -}}
{{- else -}}
    {{- printf "%s-node-message-broker-hub-auth" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return hub robot user ID
*/}}
{{- define "broker.hub.robotUser" -}}
{{- if .Values.global.hub.auth.robotUser -}}
    {{- .Values.global.hub.auth.robotUser -}}
{{- else -}}
    {{- .Values.hub.auth.robotUser -}}
{{- end -}}
{{- end -}}

{{/*
Return hub robot user secret
*/}}
{{- define "broker.hub.robotSecret" -}}
{{- if .Values.global.hub.auth.robotSecret -}}
    {{- .Values.global.hub.auth.robotSecret | b64enc -}}
{{- else -}}
    {{- .Values.hub.auth.robotSecret | b64enc -}}
{{- end -}}
{{- end -}}

{{/*
Return the Keycloak certs endpoint
*/}}
{{- define "broker.keycloak.endpoint" -}}
{{- if .Values.broker.AUTH_JWKS_URL -}}
    {{- .Values.broker.AUTH_JWKS_URL -}}
{{- else -}}
    {{- printf "http://%s-keycloak:80/keycloak/realms/flame/protocol/openid-connect/certs" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing private key
*/}}
{{- define "hub.crypto.privateKeySecretName" -}}
{{- $secretName := .Values.hub.crypto.existingSecret -}}
{{- if $secretName -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- print "node-ecdh-private-key-secret-mb" -}}
{{- end -}}
{{- end -}}

{{/*
Strip the protocol (http:// or https://) from a URL
*/}}
{{- define "broker.proxy.clean" -}}
{{- $url := . | trimPrefix "http://" | trimPrefix "https://" -}}
{{- $url -}}
{{- end }}

{{/*
Get the host:port section, removing any subpaths
*/}}
{{- define "broker.proxy.core" -}}
{{- $url := include "broker.proxy.clean" . -}}
{{- $hostPort := splitList "/" $url | first -}}
{{- $hostPort -}}
{{- end }}


{{/*
Extract only the host from proxy
*/}}
{{- define "broker.proxy.host" -}}
{{- $hostPort := include "broker.proxy.core" . -}}
{{- $split := splitList ":" $hostPort -}}
{{- index $split 0 -}}
{{- end }}

{{/*
Extract the proxy port (if present)
*/}}
{{- define "broker.proxy.port" -}}
{{- $hostPort := include "broker.proxy.core" . -}}
{{- $split := splitList ":" $hostPort -}}
{{- if gt (len $split) 1 -}}
    {{- index $split 1 -}}
{{- else -}}
    {{- print "" -}}
{{- end -}}
{{- end }}

{{/*
Generate Java proxy system properties
*/}}
{{- define "broker.proxy.java.options" -}}
{{- $httpProxy := .Values.global.node.proxy.httpProxy | default "" -}}
{{- $httpsProxy := .Values.global.node.proxy.httpsProxy | default "" -}}
{{- $options := list -}}

{{- if $httpProxy -}}
    {{- $httpHost := include "broker.proxy.host" $httpProxy -}}
    {{- $httpPort := include "broker.proxy.port" $httpProxy -}}
    {{- if and $httpHost $httpPort -}}
        {{- $options = append $options (printf "-Dhttp.proxyHost=%s" $httpHost) -}}
        {{- $options = append $options (printf "-Dhttp.proxyPort=%s" $httpPort) -}}
    {{- end -}}
{{- end -}}

{{- if $httpsProxy -}}
    {{- $httpsHost := include "broker.proxy.host" $httpsProxy -}}
    {{- $httpsPort := include "broker.proxy.port" $httpsProxy -}}
    {{- if and $httpsHost $httpsPort -}}
        {{- $options = append $options (printf "-Dhttps.proxyHost=%s" $httpsHost) -}}
        {{- $options = append $options (printf "-Dhttps.proxyPort=%s" $httpsPort) -}}
    {{- end -}}
{{- end -}}

{{- if $options -}}
    {{- $options = append $options (printf "-Dhttp.nonProxyHosts=localhost|%s-keycloak -Dhttps.nonProxyHosts=localhost|%s-keycloak" .Release.Name .Release.Name ) -}}
    {{- join " " $options -}}
{{- end -}}
{{- end }}