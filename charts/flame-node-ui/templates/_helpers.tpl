{{/*
Set the hostname of the Node UI. Assumes if global ingress enabled then global hostname is supplied
*/}}
{{- define "ui.ingress.hostname" -}}
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
Return the hub adapter endpoint
*/}}
{{- define "ui.adapter.endpoint" -}}
{{- if .Values.node.adapter -}}
    {{- .Values.node.adapter -}}
{{- else if and .Values.global.node.ingress.enabled .Values.global.node.ingress.hostname -}}
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
{{- $secretName := .Values.idp.existingSecret -}}
{{- if and $secretName ( not .Values.idp.debug ) -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- printf "%s-node-ui-keycloak-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret key that contains the Keycloak client secret
*/}}
{{- define "ui.keycloak.secretKey" -}}
{{- $secretName := .Values.idp.existingSecret -}}
{{- if .Values.idp.debug -}}
    {{- print "nodeUiClientSecret" -}}
{{- else if and $secretName .Values.idp.existingSecretKey -}}
    {{- printf "%s" .Values.idp.existingSecretKey -}}
{{- else -}}
    {{- print "nodeUiClientSecret" -}}
{{- end -}}
{{- end -}}

{{/*
Generate a random clientSecret value for the node-ui client in keycloak if none provided
*/}}
{{- define "ui.keycloak.clientSecret" -}}
{{- if .Values.idp.debug -}}
    {{- print "UU4ySGVPMkxlWE1ZMTBWclA0Y2YyeDVKSFRGSW5tNGY="  | b64enc -}}
{{- else if .Values.idp.clientSecret -}}
    {{- print .Values.idp.clientSecret  | b64enc -}}
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
Return the user IDP hostname
*/}}
{{- define "ui.userIdp.hostname" -}}
{{- if .Values.global.userIdp.hostname -}}
    {{- print .Values.global.userIdp.hostname -}}
{{- else if .Values.idp.host -}}
    {{- print .Values.idp.host -}}
{{- else if or .Values.global.node.ingress.enabled .Values.ingress.enabled -}}
    {{- printf "%s/keycloak/realms/flame" (include "ui.ingress.hostname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Keycloak service endpoint
*/}}
{{- define "ui.keycloak.service.endpoint" -}}
{{- if .Values.idp.service -}}
    {{- print .Values.idp.service -}}
{{- else -}}
    {{- printf "http://%s-keycloak:80/keycloak/realms/flame" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return the Keycloak endpoint
*/}}
{{- define "ui.userIdp.endpoint" -}}
{{- if (include "ui.userIdp.hostname" .) -}}
    {{- if hasPrefix "http" (include "ui.userIdp.hostname" .) -}}
        {{- print (include "ui.userIdp.hostname" .) -}}
    {{- else -}}
        {{- printf "http://%s" (include "ui.userIdp.hostname" .) -}}
    {{- end -}}
{{- else -}}
    {{- print "http://localhost:8080/keycloak/realms/flame" -}}
{{- end -}}
{{- end -}}