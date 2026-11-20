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
Image reference, redirected to the mirror in global.imageRegistry when that is set. The mirror keeps the upstream path
without the registry host and with Docker Hub's implicit "library/":
ghcr.io/privateaim/node-ui:1.2.1 -> <registry>/privateaim/node-ui:1.2.1, busybox:1.37 -> <registry>/library/busybox:1.37
Usage: {{ include "flame-node.image" (list $ "repository:tag") }}
*/}}
{{- define "flame-node.image" -}}
{{- $image := index . 1 -}}
{{- with (index . 0).Values.global.imageRegistry -}}
{{- $path := splitList "/" $image -}}
{{- $dockerHub := true -}}
{{- if and (gt (len $path) 1) (regexMatch "[.:]|^localhost$" (first $path)) -}}
{{- $dockerHub = has (first $path) (list "docker.io" "index.docker.io" "registry-1.docker.io") -}}
{{- $path = rest $path -}}
{{- end -}}
{{- if and $dockerHub (eq (len $path) 1) -}}
{{- $path = prepend $path "library" -}}
{{- end -}}
{{- $image = printf "%s/%s" (trimSuffix "/" .) (join "/" $path) -}}
{{- end -}}
{{- $image -}}
{{- end -}}

{{/*
Names of the image pull secrets of a pod as one comma-separated string, since include can only return strings (secret names
cannot contain commas). Reads global.imagePullSecrets first, then the component's own list, and keeps the first occurrence
of each name. An entry is a "name:" object or a plain name; a single string instead of a list counts as one name; empty
entries and objects without a name are skipped. With
  global:
    imagePullSecrets:
      - name: harbor-pull-secret
  ui:
    imagePullSecrets:
      - name: harbor-pull-secret
      - name: ui-secret
it returns "harbor-pull-secret,ui-secret" for the UI, and "" when neither list has a name.
Usage: {{ include "flame-node.imagePullSecretNames" (list $ .Values.ui.imagePullSecrets) }}
*/}}
{{- define "flame-node.imagePullSecretNames" -}}
{{- $names := list -}}
{{- range $secrets := list (index . 0).Values.global.imagePullSecrets (index . 1) -}}
{{- range (kindIs "string" $secrets | ternary (list $secrets) ($secrets | default list)) -}}
{{- if kindIs "map" . -}}
{{- with .name -}}{{- $names = append $names . -}}{{- end -}}
{{- else if . -}}
{{- $names = append $names (toString .) -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- uniq $names | join "," -}}
{{- end -}}

{{/*
imagePullSecrets field of a pod spec, rendered from "flame-node.imagePullSecretNames"; empty when there are none.
Usage:
      {{- with include "flame-node.imagePullSecrets" (list $ .Values.ui.imagePullSecrets) }}
      {{- . | nindent 6 }}
      {{- end }}
*/}}
{{- define "flame-node.imagePullSecrets" -}}
{{- with include "flame-node.imagePullSecretNames" . -}}
imagePullSecrets:
{{- range splitList "," . }}
  - name: {{ . }}
{{- end }}
{{- end -}}
{{- end -}}

{{/*
Return the URL scheme for components: "https" when a TLS secret is configured via expose.tls.secretName, otherwise "http".
*/}}
{{- define "hostname.protocol" -}}
{{- if .Values.expose.tls.secretName -}}
https
{{- else -}}
http
{{- end -}}
{{- end -}}

{{/*
Prefix a hostname with a scheme, defaulting via node.scheme when the hostname doesn't already include one.
*/}}
{{- define "hostname.withProtocol" -}}
{{- $hostname := index . 0 -}}
{{- $ctx := index . 1 -}}
{{- if hasPrefix "http" $hostname -}}
    {{- $hostname -}}
{{- else -}}
    {{- printf "%s://%s" (include "hostname.protocol" $ctx) $hostname -}}
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
    {{- include "hostname.withProtocol" (list .Values.expose.hostname .) -}}
{{- else -}}
    {{- "http://localhost:3000" -}}
{{- end -}}
{{- end -}}


{{/*
Return the hub IDP issuer URL, combining hub.endpoints.auth with hub.auth.userRealm e.g. "https://auth.privateaim.dev/realms/myRealm"
*/}}
{{- define "hub.auth.issuerUrl" -}}
{{- $realm := required "hub.auth.userRealm is required" .Values.hub.auth.userRealm -}}
{{- printf "%s/realms/%s" (.Values.hub.endpoints.auth | trimSuffix "/") $realm -}}
{{- end -}}

{{/*
Return Authup's flat JWKS endpoint, e.g. "https://auth.privateaim.dev/jwks", which publishes
the signing keys of every realm.
The Hub creates each analysis's Authup client in the analysis's realm (= its project's realm),
and Authup signs the analysis token with that realm's key. A realm-scoped
/realms/<realm>/jwks would make message-broker, storage-service and pod-orchestrator reject
(unknown kid) every analysis whose project lives outside hub.auth.userRealm.
*/}}
{{- define "hub.auth.jwksEndpoint" -}}
{{- printf "%s/jwks" (.Values.hub.endpoints.auth | trimSuffix "/") -}}
{{- end -}}

{{/*
Return the Authup token endpoint. Authup mounts its token controller at the flat /token path
(there is no /realms/<realm>/token route), matching the token_endpoint in its OIDC discovery.
*/}}
{{- define "hub.auth.tokenEndpoint" -}}
{{- printf "%s/token" (.Values.hub.endpoints.auth | trimSuffix "/") -}}
{{- end -}}

{{/*
Return the secret containing the hub robot secret
*/}}
{{- define "hub.secretName" -}}
{{- $clientSecretName := .Values.hub.auth.existingSecret -}}
{{- if $clientSecretName -}}
    {{- printf "%s" (tpl $clientSecretName $) -}}
{{- else -}}
    {{- printf "%s-hub-client-secret" .Release.Name -}}
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
Return the hub adapter endpoint
*/}}
{{- define "ui.adapter.endpoint" -}}
{{- if and (ne .Values.expose.type "none") .Values.expose.hostname (not (contains "localhost" .Values.expose.hostname)) -}}
    {{- printf "%s/api" (include "hostname.withProtocol" (list .Values.expose.hostname .)) -}}
{{- else -}}
    {{- print "http://localhost:5000" -}}
{{- end -}}
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
Return the JWKS endpoint for user and client authentication which overrides what is fetched by the API.
Defaults to Authup's flat /jwks: analysis containers call the hub adapter with tokens signed by their
project's realm, which the IDP_URL realm's discovered JWKS does not contain.
*/}}
{{- define "adapter.jwks.endpoint" -}}
{{- if .Values.hubAdapter.idp.jwks -}}
    {{- print .Values.hubAdapter.idp.jwks -}}
{{- else -}}
    {{- include "hub.auth.jwksEndpoint" . -}}
{{- end -}}
{{- end -}}

{{/*
Return the name of the Secret containing the nuxtAuthSecret
*/}}
{{- define "ui.nuxtAuth.secretName" -}}
{{- if .Values.ui.nuxtAuthExistingSecret -}}
    {{- printf "%s" .Values.ui.nuxtAuthExistingSecret -}}
{{- else -}}
    {{- printf "%s-node-ui-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*Storage Service helpers*/}}
{{/*
Return the endpoint of the SeaweedFS S3 gateway.
*/}}
{{- define "seaweedfs.s3.endpoint" -}}
{{- printf "%s-seaweedfs-all-in-one:8333" .Release.Name -}}
{{- end -}}

{{/*
Return of the SeaweedFS master endpoint
*/}}
{{- define "seaweedfs.master.endpoint" -}}
{{- printf "%s-seaweedfs-all-in-one.%s:9333" .Release.Name .Release.Namespace -}}
{{- end -}}

{{/*
Return the SeaweedFS filer endpoint
*/}}
{{- define "seaweedfs.filer.endpoint" -}}
{{- printf "%s-seaweedfs-all-in-one.%s:8888" .Release.Name .Release.Namespace -}}
{{- end -}}

{{/*
Return the name of the Secret that holds the SeaweedFS S3 admin credentials.
*/}}
{{- define "seaweedfs.s3.secretName" -}}
{{- printf "%s-seaweedfs-s3-secret" .Release.Name -}}
{{- end -}}

{{/*
Return "true" when the storage service uses an external S3 instance instead of the bundled SeaweedFS.
*/}}
{{- define "storageService.s3.external" -}}
{{- if .Values.storageService.s3.endpoint -}}
true
{{- end -}}
{{- end -}}

{{/*
Return the S3 endpoint (host:port) used by the storage service.
*/}}
{{- define "storageService.s3.endpoint" -}}
{{- if include "storageService.s3.external" . -}}
{{- $endpoint := .Values.storageService.s3.endpoint -}}
{{- if regexMatch "^[a-zA-Z][a-zA-Z0-9+.-]*://" $endpoint -}}
{{- fail (printf "storageService.s3.endpoint must be host:port without a scheme (got %q). Use storageService.s3.tls.enabled to select HTTPS." $endpoint) -}}
{{- end -}}
{{- $endpoint -}}
{{- else if .Values.seaweedfs.enabled -}}
{{- include "seaweedfs.s3.endpoint" . -}}
{{- else -}}
{{- fail "storageService.s3.endpoint must be set when seaweedfs.enabled=false: the storage service needs an S3 instance." -}}
{{- end -}}
{{- end -}}

{{/*
Return the name of the Secret that holds the S3 credentials used by the storage service.
*/}}
{{- define "storageService.s3.secretName" -}}
{{- if include "storageService.s3.external" . -}}
{{- if .Values.storageService.s3.existingSecret -}}
{{- tpl .Values.storageService.s3.existingSecret $ -}}
{{- else -}}
{{- printf "%s-storage-s3-secret" .Release.Name -}}
{{- end -}}
{{- else -}}
{{- include "seaweedfs.s3.secretName" . -}}
{{- end -}}
{{- end -}}

{{/*
Return the Secret keys holding the S3 access and secret key, as a dict with "accessKey" and "secretKey".
*/}}
{{- define "storageService.s3.secretKeys" -}}
{{- if include "storageService.s3.external" . -}}
{{- dict "accessKey" "accessKey" "secretKey" "secretKey" | toJson -}}
{{- else -}}
{{- dict "accessKey" "admin_access_key_id" "secretKey" "admin_secret_access_key" | toJson -}}
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
    {{- printf "%s-ecdh-private-key-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{/*
Return a checksum of externally provisioned node credentials. These Secrets are
updated outside Helm, so hashing the rendered values alone would not trigger a
rollout when credentials rotate.
*/}}
{{- define "flame-node.credentialsChecksum" -}}
{{- $clientSecret := lookup "v1" "Secret" .Release.Namespace (include "hub.secretName" .) -}}
{{- $privateKeySecret := lookup "v1" "Secret" .Release.Namespace (include "hub.crypto.privateKeySecretName" .) -}}
{{- printf "%s|%s" (toJson (default (dict) $clientSecret.data)) (toJson (default (dict) $privateKeySecret.data)) | sha256sum -}}
{{- end -}}

{{/*
Return a checksum of the S3 credentials used by the storage service, so it rolls out when they rotate.
*/}}
{{- define "storageService.s3.credentialsChecksum" -}}
{{- $s3Secret := lookup "v1" "Secret" .Release.Namespace (include "storageService.s3.secretName" .) -}}
{{- toJson (default (dict) $s3Secret.data) | sha256sum -}}
{{- end -}}


{{/*
Strip scheme from expose.hostname for Gateway API hostnames (HTTPRoute.spec.hostnames, listener hostname).
*/}}
{{- define "flame-node.gateway.routeHostname" -}}
{{- regexReplaceAll "^https?://(.*)" .Values.expose.hostname "${1}" -}}
{{- end -}}

{{/*
Return "true" when VictoriaLogs is exposed at /logs (Ingress or HTTPRoute, plus the UI link).
victorialogs.ingress.enabled is the deprecated name of victorialogs.expose.enabled and still applies to both.
*/}}
{{- define "flame-node.victorialogs.exposed" -}}
{{- if and .Values.victorialogs.enabled (or .Values.victorialogs.expose.enabled .Values.victorialogs.ingress.enabled) (or (eq .Values.expose.type "ingress") (eq .Values.expose.type "gateway")) -}}
true
{{- end -}}
{{- end -}}

{{/*
Strip scheme from the data-store SeaweedFS admin panel hostname for Gateway API.
*/}}
{{- define "flame-node.dataStore.seaweedfs.admin.routeHostname" -}}
{{- regexReplaceAll "^https?://(.*)" .Values.dataStore.seaweedfs.admin.gateway.hostname "${1}" -}}
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
