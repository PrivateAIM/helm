{{/*
Set the API's root path. If ingress is enabled, defaults to "/api" else remains blank
*/}}
{{- define "adapter.root.path" -}}
{{- if or .Values.global.node.ingress.enabled .Values.ingress.enabled -}}
    {{- print "/api" -}}
{{- else -}}
    {{- print "" -}}
{{- end -}}
{{- end -}}

{{/*
Set the API's root path. If ingress is enabled, defaults to "/api" else remains blank
*/}}
{{- define "adapter.ingress.hostname" -}}
{{- if .Values.global.node.ingress.hostname -}}
    {{- .Values.global.node.ingress.hostname -}}
{{- else -}}
    {{- .Values.ingress.hostname -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the hub robot secret
*/}}
{{- define "adapter.hub.secretName" -}}
{{- $globalRobotSecretName := .Values.global.hub.auth.existingSecret -}}
{{- $robotSecretName := .Values.hub.auth.existingSecret -}}
{{- if $globalRobotSecretName -}}
    {{- printf "%s" (tpl $globalRobotSecretName $) -}}
{{- else if $robotSecretName -}}
    {{- printf "%s" (tpl $robotSecretName $) -}}
{{- else -}}
    {{- printf "%s-hub-adapter-robot-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return hub auth API endpoint
*/}}
{{- define "adapter.hub.authApi" -}}
{{- if .Values.global.hub.endpoints.auth -}}
    {{- .Values.global.hub.endpoints.auth -}}
{{- else -}}
    {{- .Values.hub.endpoints.auth -}}
{{- end -}}
{{- end -}}

{{/*
Return hub core API endpoint
*/}}
{{- define "adapter.hub.coreApi" -}}
{{- if .Values.global.hub.endpoints.core -}}
    {{- .Values.global.hub.endpoints.core -}}
{{- else -}}
    {{- .Values.hub.endpoints.core -}}
{{- end -}}
{{- end -}}

{{/*
Return hub robot user ID
*/}}
{{- define "adapter.hub.robotUser" -}}
{{- if .Values.global.hub.auth.robotUser -}}
    {{- .Values.global.hub.auth.robotUser -}}
{{- else -}}
    {{- .Values.hub.auth.robotUser -}}
{{- end -}}
{{- end -}}

{{/*
Return hub robot user secret
*/}}
{{- define "adapter.hub.robotSecret" -}}
{{- if .Values.global.hub.auth.robotSecret -}}
    {{- .Values.global.hub.auth.robotSecret | b64enc -}}
{{- else -}}
    {{- .Values.hub.auth.robotSecret | b64enc -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the Keycloak client secret
*/}}
{{- define "adapter.keycloak.secretName" -}}
{{- $secretName := .Values.idp.existingSecret -}}
{{- if and $secretName ( not .Values.idp.debug ) -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- printf "%s-hub-adapter-keycloak-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret key that contains the Keycloak client secret
*/}}
{{- define "adapter.keycloak.secretKey" -}}
{{- $secretName := .Values.idp.existingSecret -}}
{{- if .Values.idp.debug -}}
    {{- print "hubAdapterClientSecret" -}}
{{- else if and $secretName .Values.idp.existingSecretKey -}}
    {{- printf "%s" .Values.idp.existingSecretKey -}}
{{- else -}}
    {{- print "hubAdapterClientSecret" -}}
{{- end -}}
{{- end -}}

{{/*
Generate a random clientSecret value for the hub-adapter client in keycloak if none provided
*/}}
{{- define "adapter.keycloak.clientSecret" -}}
{{- if .Values.idp.debug -}}
    {{- print "cFR2THJCS3V5MHZ4cnV2VXByd3NYcEV0dzg0ZEROOUM=" | b64enc -}}
{{- else if .Values.idp.clientSecret -}}
    {{- print .Values.idp.clientSecret | b64enc -}}
{{- else -}}
{{/*    {{- print ( randAlphaNum 22 | b64enc | quote ) -}}*/}}
    {{- /* Create "hub_secret" dict inside ".Release" to store various stuff. */ -}}
    {{- if not (index .Release "hub_secret") -}}
        {{-   $_ := set .Release "hub_secret" dict -}}
    {{- end -}}
    {{- /* Some random ID of this password, in case there will be other random values alongside this instance. */ -}}
    {{- $key := printf "%s_%s" .Release.Name "password" -}}
    {{- /* If $key does not yet exist in .Release.hub_secret, then... */ -}}
    {{- if not (index .Release.hub_secret $key) -}}
        {{- /* ... store random password under the $key */ -}}
        {{-   $_ := set .Release.hub_secret $key (randAlphaNum 32) -}}
    {{- end -}}
        {{- /* Retrieve previously generated value. */ -}}
        {{- print (index .Release.hub_secret $key | b64enc) -}}
{{- end -}}
{{- end -}}

{{/*
Return user IDP endpoint
*/}}
{{- define "adapter.userIdp.endpoint" -}}
{{- if .Values.global.userIdp.hostname -}}
    {{- print .Values.global.userIdp.hostname -}}
{{- else if .Values.idp.host -}}
    {{- .Values.idp.host -}}
{{- else -}}
    {{- printf "http://%s-keycloak:80%s/realms/flame" .Release.Name .Values.idp.httpRelativePath -}}
{{- end -}}
{{- end -}}

{{/*
Return the JWKS endpoint for user and client authentication which overrides what is fetched by the API.
*/}}
{{- define "adapter.jwks.endpoint" -}}
{{- if .Values.offline -}}
    {{- printf "http://%s-keycloak:80/keycloak/realms/flame/protocol/openid-connect/certs" .Release.Name -}}
{{- else if .Values.idp.jwks -}}
    {{- print .Values.idp.jwks -}}
{{- else -}}
    {{- print "" -}}
{{- end -}}
{{- end -}}

{{/*
Return the Results service endpoint
*/}}
{{- define "adapter.results.endpoint" -}}
{{- if .Values.node.results -}}
    {{- .Values.node.results -}}
{{- else -}}
    {{- printf "http://%s-node-result-service:8080" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the Kong admin service endpoint
*/}}
{{- define "adapter.kong.endpoint" -}}
{{- if .Values.node.kong -}}
    {{- .Values.node.kong -}}
{{- else -}}
    {{- printf "http://%s-kong-admin:80" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the Pod Orchestrator endpoint
*/}}
{{- define "adapter.po.endpoint" -}}
{{- if .Values.node.po -}}
    {{- .Values.node.po -}}
{{- else -}}
    {{- printf "http://%s-po-service:8000" .Release.Name -}}
{{- end -}}
{{- end -}}
