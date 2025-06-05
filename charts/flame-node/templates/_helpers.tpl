{{/*Possibly TODO REMOVE*/}}

{{/*
Return hub auth API endpoint
*/}}
{{- define "hub.authApi" -}}
{{- if .Values.global.hub.endpoints.auth -}}
    {{- .Values.global.hub.endpoints.auth -}}
{{- else -}}
    {{- .Values.hub.endpoints.auth -}}
{{- end -}}
{{- end -}}

{{/*
Return hub core API endpoint
*/}}
{{- define "hub.coreApi" -}}
{{- if .Values.global.hub.endpoints.core -}}
    {{- .Values.global.hub.endpoints.core -}}
{{- else -}}
    {{- .Values.hub.endpoints.core -}}
{{- end -}}
{{- end -}}

{{/*
Return hub robot user ID
*/}}
{{- define "hub.robotUser" -}}
{{- if .Values.global.hub.auth.robotUser -}}
    {{- .Values.global.hub.auth.robotUser -}}
{{- else -}}
    {{- .Values.hub.auth.robotUser -}}
{{- end -}}
{{- end -}}

{{/*
Return hub robot user secret
*/}}
{{- define "hub.robotSecret" -}}
{{- if .Values.global.hub.auth.robotSecret -}}
    {{- .Values.global.hub.auth.robotSecret | b64enc -}}
{{- else -}}
    {{- .Values.hub.auth.robotSecret | b64enc -}}
{{- end -}}
{{- end -}}

{{/*Global Helpers*/}}

{{/*
Set the hostname of the Node UI. Assumes if global ingress enabled then global hostname is supplied
*/}}
{{- define "node.ingress.hostname" -}}
{{- if .Values.global.node.ingress.enabled  -}}
    {{- if .Values.global.node.ingress.hostname -}}
        {{- if not (hasPrefix "http" .Values.global.node.ingress.hostname) -}}
            {{- printf "https://%s" .Values.global.node.ingress.hostname -}}
        {{- else -}}
            {{- print .Values.global.node.ingress.hostname -}}
        {{- end -}}
    {{- else -}}
        {{- print "http://localhost:3000" -}}
    {{- end -}}
{{- else if .Values.ingress.enabled  -}}
    {{- if .Values.ingress.hostname -}}
        {{- if not (hasPrefix "http" .Values.ingress.hostname) -}}
            {{- printf "https://%s" .Values.ingress.hostname -}}
        {{- else -}}
            {{- print .Values.ingress.hostname -}}
        {{- end -}}
    {{- else -}}
        {{- print "http://localhost:3000" -}}
    {{- end -}}
{{- else -}}
    {{- print "http://localhost:3000" -}}
{{- end -}}
{{- end -}}

{{/*
Return the user IDP hostname
*/}}
{{- define "userIdp.hostname" -}}
{{- if .Values.userIdp.hostname -}}
    {{- if hasPrefix "http" .Values.userIdp.hostname -}}
        {{- print .Values.userIdp.hostname -}}
    {{- else -}}
        {{- printf "http://%s" .Values.userIdp.hostname -}}
    {{- end -}}
{{- else if or .Values.global.node.ingress.enabled .Values.ingress.enabled -}}
    {{- printf "%s/keycloak/realms/flame" (include "node.ingress.hostname" .) -}}
{{- end -}}
{{- end -}}

{{/*UI helpers*/}}

{{/*
Return the endpoint for user authentication
*/}}
{{- define "ui.userIdp.endpoint" -}}
{{- if (include "userIdp.hostname" .) -}}
    {{- print (include "userIdp.hostname" .) -}}
{{- else -}}
    {{- print "http://localhost:8080/keycloak/realms/flame" -}}
{{- end -}}
{{- end -}}

{{/*
Return the hub adapter endpoint
*/}}
{{- define "ui.adapter.endpoint" -}}
{{- if and .Values.global.node.ingress.enabled .Values.global.node.ingress.hostname -}}
    {{- if hasPrefix "http" .Values.global.node.ingress.hostname -}}
        {{- printf "%s/api" .Values.global.node.ingress.hostname -}}
    {{- else -}}
        {{- printf "http://%s/api" .Values.global.node.ingress.hostname -}}
    {{- end -}}
{{- else -}}
    {{- print "http://localhost:5000" -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the Keycloak client secret
*/}}
{{- define "ui.keycloak.secretName" -}}
{{- $secretName := .Values.ui.idp.existingSecret -}}
{{- if and $secretName ( not .Values.ui.idp.debug ) -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- printf "%s-node-ui-keycloak-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret key that contains the Keycloak client secret
*/}}
{{- define "ui.keycloak.secretKey" -}}
{{- $secretName := .Values.ui.idp.existingSecret -}}
{{- if .Values.ui.idp.debug -}}
    {{- print "nodeUiClientSecret" -}}
{{- else if and $secretName .Values.ui.idp.existingSecretKey -}}
    {{- printf "%s" .Values.ui.idp.existingSecretKey -}}
{{- else -}}
    {{- print "nodeUiClientSecret" -}}
{{- end -}}
{{- end -}}

{{/*
Generate a random clientSecret value for the node-ui client in keycloak if none provided
*/}}
{{- define "ui.keycloak.clientSecret" -}}
{{- if .Values.ui.idp.debug -}}
    {{- print "UU4ySGVPMkxlWE1ZMTBWclA0Y2YyeDVKSFRGSW5tNGY="  | b64enc -}}
{{- else if .Values.ui.idp.clientSecret -}}
    {{- print .Values.ui.idp.clientSecret  | b64enc -}}
{{- else -}}
    {{- /* Create "node_ui_secret" dict inside ".Release" to store various stuff. */ -}}
    {{- if not (index .Release "node_ui_secret") -}}
        {{-   $_ := set .Release "node_ui_secret" dict -}}
    {{- end -}}
    {{- /* Some random ID of this password, in case there will be other random values alongside this instance. */ -}}
    {{- $key := printf "%s_%s" .Release.Name "password" -}}
    {{- /* If $key does not yet exist in .Release.node_ui_secret, then... */ -}}
    {{- if not (index .Release.node_ui_secret $key) -}}
        {{- /* ... store random password under the $key */ -}}
        {{-   $_ := set .Release.node_ui_secret $key (randAlphaNum 32) -}}
    {{- end -}}
        {{- /* Retrieve previously generated value. */ -}}
        {{- print (index .Release.node_ui_secret $key | b64enc) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Keycloak service endpoint
*/}}
{{- define "ui.keycloak.service.endpoint" -}}
{{- if .Values.ui.idp.service -}}
    {{- print .Values.ui.idp.service -}}
{{- else -}}
    {{- printf "http://%s-keycloak:80/keycloak/realms/flame" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*Hub Adapter helpers*/}}

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
Return the endpoint for user authentication
*/}}
{{- define "adapter.userIdp.endpoint" -}}
{{- if (include "userIdp.hostname" .) -}}
    {{- print (include "userIdp.hostname" .) -}}
{{- else -}}
    {{- printf "http://%s-keycloak:80/keycloak/realms/flame" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the hub robot secret
*/}}
{{- define "hub.secretName" -}}
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
Return the secret containing the Keycloak client secret
*/}}
{{- define "adapter.keycloak.secretName" -}}
{{- $secretName := .Values.hubAdapter.idp.existingSecret -}}
{{- if and $secretName ( not .Values.hubAdapter.idp.debug ) -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- printf "%s-hub-adapter-keycloak-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Generate a random clientSecret value for the hub-adapter client in keycloak if none provided
*/}}
{{- define "adapter.keycloak.clientSecret" -}}
{{- if .Values.hubAdapter.idp.debug -}}
    {{- print "cFR2THJCS3V5MHZ4cnV2VXByd3NYcEV0dzg0ZEROOUM=" | b64enc -}}
{{- else if .Values.hubAdapter.idp.clientSecret -}}
    {{- print .Values.hubAdapter.idp.clientSecret | b64enc -}}
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
Return the secret key that contains the Keycloak client secret
*/}}
{{- define "adapter.keycloak.secretKey" -}}
{{- $secretName := .Values.hubAdapter.idp.existingSecret -}}
{{- if .Values.hubAdapter.idp.debug -}}
    {{- print "hubAdapterClientSecret" -}}
{{- else if and $secretName .Values.hubAdapter.idp.existingSecretKey -}}
    {{- printf "%s" .Values.hubAdapter.idp.existingSecretKey -}}
{{- else -}}
    {{- print "hubAdapterClientSecret" -}}
{{- end -}}
{{- end -}}

{{/*
Return the JWKS endpoint for user and client authentication which overrides what is fetched by the API.
*/}}
{{- define "adapter.jwks.endpoint" -}}
{{- if .Values.hubAdapter.offline -}}
    {{- printf "http://%s-keycloak:80/keycloak/realms/flame/protocol/openid-connect/certs" .Release.Name -}}
{{- else if .Values.hubAdapter.idp.jwks -}}
    {{- print .Values.hubAdapter.idp.jwks -}}
{{- else -}}
    {{- print "" -}}
{{- end -}}
{{- end -}}