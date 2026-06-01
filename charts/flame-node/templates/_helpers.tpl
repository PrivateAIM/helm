{{/*Global Helpers*/}}

{{/*
Certificate authority config map name
*/}}
{{- define "tls.configMapName" -}}
{{- $configMapName := .Values.certificateConfigMap -}}
{{- if $configMapName -}}
    {{- printf "%s" (tpl $configMapName $) -}}
{{- else -}}
    {{- printf "%s-additional-certs" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return whether there are any certificates provided either via config map or files. 
Returns either "true" or empty string
*/}}
{{- define "tls.hasCerts" -}}
{{- $certFiles := .Files.Glob "certs/**.pem" -}}
{{- if or .Values.certificateConfigMap (gt (len $certFiles) 0) -}}
true
{{- end -}}
{{- end -}}

{{/*
Return the normalized hostname for all node components. Source of truth: expose.hostname.
*/}}
{{- define "node.hostname" -}}
{{- if and (ne .Values.expose.type "none") (not .Values.expose.hostname) -}}
    {{- fail "expose.hostname must be set when expose.type is 'ingress' or 'gateway'" -}}
{{- end -}}
{{- if .Values.expose.hostname -}}
    {{- if hasPrefix "http" .Values.expose.hostname -}}
        {{- .Values.expose.hostname -}}
    {{- else -}}
        {{- printf "http://%s" .Values.expose.hostname -}}
    {{- end -}}
{{- else -}}
    {{- "http://localhost:3000" -}}
{{- end -}}
{{- end -}}


{{/*
Return the secret containing the hub robot secret
*/}}
{{- define "hub.secretName" -}}
{{- $clientSecretName := .Values.hub.auth.existingSecret -}}
{{- if $clientSecretName -}}
    {{- printf "%s" (tpl $clientSecretName $) -}}
{{- else -}}
    {{- printf "%s-hub-robot-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{- define "keycloak.relativePath.normalized" -}}
{{- $path := .Values.keycloakx.http.relativePath | default "/" -}}
{{- if eq $path "/" -}}
{{- print "" -}}
{{- else -}}
{{- printf "/%s" (trimAll "/" $path) -}}
{{- end -}}
{{- end -}}

{{/*
Return the name of the Secret containing Keycloak bootstrap admin credentials.
When keycloakx.auth.existingSecret is set, that Secret is used and the chart does not create one.
The Secret must contain keys KC_BOOTSTRAP_ADMIN_USERNAME and KC_BOOTSTRAP_ADMIN_PASSWORD.
*/}}
{{- define "keycloak.credentials.secretName" -}}
{{- if .Values.keycloakx.auth.existingSecret -}}
    {{- printf "%s" (tpl .Values.keycloakx.auth.existingSecret $) -}}
{{- else -}}
    {{- print "flame-keycloak-credentials-secret" -}}
{{- end -}}
{{- end -}}

{{/*
Return the service route for the internal keycloak instance"
*/}}
{{- define "keycloak.svc.route" -}}
{{- printf "%s-keycloak-http.%s.svc.cluster.local" .Release.Name .Release.Namespace -}}
{{- end -}}


{{/*
Return the endpoint for the internal keycloak instance with the (cleaned) relative path e.g. "/keycloak"
*/}}
{{- define "keycloak.base.endpoint" -}}
{{- printf "http://%s:80%s" (include "keycloak.svc.route" .) (include "keycloak.relativePath.normalized" .) -}}
{{- end -}}

{{/*
Return the internal Keycloak service endpoint with the realm
*/}}
{{- define "keycloak.service.endpoint" -}}
{{- printf "%s/realms/flame" (include "keycloak.base.endpoint" .) -}}
{{- end -}}

{{/*
Return the internal Keycloak JWKS endpoint
*/}}
{{- define "keycloak.jwks.endpoint" -}}
{{- printf "%s/protocol/openid-connect/certs" (include "keycloak.service.endpoint" .) -}}
{{- end -}}

{{/*
Return the user IDP hostname
*/}}
{{- define "userIdp.hostname" -}}
{{- $hostname := include "node.hostname" . -}}
{{- if .Values.userIdp.hostname -}}
    {{- if hasPrefix "http" .Values.userIdp.hostname -}}
        {{- print .Values.userIdp.hostname -}}
    {{- else -}}
        {{- printf "http://%s" .Values.userIdp.hostname -}}
    {{- end -}}
{{- else if and $hostname (ne .Values.expose.type "none") (not (contains "localhost" $hostname)) -}}
    {{- printf "%s%s/realms/flame" $hostname (include "keycloak.relativePath.normalized" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the postgres user database secrets
*/}}
{{- define "postgresql.user.secretName" -}}
{{- $secretName := .Values.postgresql.userDatabase.existingSecret -}}
{{- if $secretName -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- print "postgres-credentials-secret" -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the postgres admin credentials
*/}}
{{- define "postgresql.admin.secretName" -}}
{{- $secretName := .Values.postgresql.settings.existingSecret -}}
{{- if $secretName -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- print "postgres-credentials-secret" -}}
{{- end -}}
{{- end -}}

{{- define "postgresql.endpoint" -}}
{{- if .Values.postgresql.fullnameOverride -}}
    {{- print .Values.postgresql.fullnameOverride -}}
{{- else if .Values.postgresql.nameOverride -}}
    {{- printf "%s-%s" .Release.Name .Values.postgresql.nameOverride -}}
{{- else -}}
    {{- printf "%s-postgresql" .Release.Name -}}
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
    {{- printf "http://localhost:8080%s/realms/flame" (include "keycloak.relativePath.normalized" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return whether to enable internal routing to Keycloak for the UI
If offline is true - true, else if external IDP hostname is provided - false, else if expose.type is none or localhost used - true, else false
*/}}
{{- define "ui.auth.internal" -}}
{{- $exposeDisabled := eq .Values.expose.type "none" -}}
{{- if .Values.offline -}}
    true
{{- else if .Values.userIdp.hostname -}}
    false
{{- else if or (contains "localhost" (include "ui.userIdp.endpoint" .)) $exposeDisabled -}}
    true
{{- else -}}
    false
{{- end -}}
{{- end -}}

{{/*
Return the hub adapter endpoint
*/}}
{{- define "ui.adapter.endpoint" -}}
{{- if and (ne .Values.expose.type "none") .Values.expose.hostname (not (contains "localhost" .Values.expose.hostname)) -}}
    {{- if hasPrefix "http" .Values.expose.hostname -}}
        {{- printf "%s/api" .Values.expose.hostname -}}
    {{- else -}}
        {{- printf "http://%s/api" .Values.expose.hostname -}}
    {{- end -}}
{{- else -}}
    {{- print "http://localhost:5000" -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret containing the Keycloak client secret
*/}}
{{- define "ui.keycloak.secretName" -}}
{{- if .Values.ui.idp.clientSecret -}}
    {{- printf "%s-node-ui-idp-secret" .Release.Name -}}
{{- else -}}
{{- $secretName := .Values.ui.idp.existingSecret -}}
{{- if and $secretName ( not .Values.ui.idp.debug ) -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- printf "%s-keycloak-client-secrets" .Release.Name -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return the secret key that contains the Keycloak client secret
*/}}
{{- define "ui.keycloak.secretKey" -}}
{{- if or .Values.ui.idp.clientSecret .Values.ui.idp.debug -}}
    {{- print "nodeUiClientSecret" -}}
{{- else if and .Values.ui.idp.existingSecret .Values.ui.idp.existingSecretKey -}}
    {{- printf "%s" .Values.ui.idp.existingSecretKey -}}
{{- else -}}
    {{- print "nodeUiClientSecret" -}}
{{- end -}}
{{- end -}}


{{/*
Create valid redirect URIs for keycloak i.e. http & https
*/}}
{{- define "ui.keycloak.redirectUris" -}}
{{- $hostnameStripped := regexReplaceAll "^https?://(.*)" (include "node.hostname" .) "${1}" -}}
{{- printf "[ \"https://%s/*\", \"http://%s/*\" ]" $hostnameStripped $hostnameStripped -}}
{{- end -}}

{{/*Hub Adapter helpers*/}}
{{/*
Set the API's root path. If expose is configured (not none), defaults to "/api" else remains blank
*/}}
{{- define "adapter.root.path" -}}
{{- if ne .Values.expose.type "none" -}}
    {{- print "/api" -}}
{{- else -}}
    {{- print "" -}}
{{- end -}}
{{- end -}}

{{/*
Return the endpoint for user authentication
*/}}
{{- define "adapter.userIdp.endpoint" -}}
{{- if .Values.userIdp.hostname -}}
    {{- print (include "userIdp.hostname" .) -}}
{{- else -}}
    {{- print (include "keycloak.service.endpoint" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the JWKS endpoint for user and client authentication which overrides what is fetched by the API.
*/}}
{{- define "adapter.jwks.endpoint" -}}
{{- if .Values.offline -}}
    {{- print (include "keycloak.jwks.endpoint" .) -}}
{{- else if .Values.hubAdapter.idp.jwks -}}
    {{- print .Values.hubAdapter.idp.jwks -}}
{{- else -}}
    {{- print "" -}}
{{- end -}}
{{- end -}}

{{/*Storage Service helpers*/}}
{{/*
Return the secret containing private key
*/}}
{{- define "hub.crypto.privateKeySecretName" -}}
{{- $secretName := .Values.hub.crypto.existingSecret -}}
{{- if $secretName -}}
    {{- printf "%s" (tpl $secretName $) -}}
{{- else -}}
    {{- printf "%s-ecdh-private-key-secret" .Release.Name -}}
{{- end -}}
{{- end -}}


{{/*
Strip scheme from expose.hostname for Gateway API hostnames (HTTPRoute.spec.hostnames, listener hostname).
*/}}
{{- define "flame-node.gateway.routeHostname" -}}
{{- regexReplaceAll "^https?://(.*)" .Values.expose.hostname "${1}" -}}
{{- end -}}

{{/*
Return the parentRefs list item for HTTPRoutes targeting the node Gateway.
When expose.gateway.external is true, references the user-supplied external Gateway;
otherwise references the chart-managed Gateway.
*/}}
{{- define "flame-node.gateway.parentRefs" -}}
{{- if .Values.expose.gateway.external -}}
{{- $name := required "expose.gateway.parentRef.name is required when expose.gateway.external=true" .Values.expose.gateway.parentRef.name -}}
- group: gateway.networking.k8s.io
  kind: Gateway
  name: {{ $name }}
  {{- if .Values.expose.gateway.parentRef.namespace }}
  namespace: {{ .Values.expose.gateway.parentRef.namespace }}
  {{- end }}
  {{- if .Values.expose.gateway.parentRef.sectionName }}
  sectionName: {{ .Values.expose.gateway.parentRef.sectionName }}
  {{- end }}
{{- else -}}
- name: {{ .Release.Name }}-node-gateway
{{- end -}}
{{- end -}}
