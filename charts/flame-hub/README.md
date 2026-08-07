# FLAME Hub Helm Chart
The FLAME Hub Chart provides a default configuration in `values.yaml` but is meant to be installed with your own adjusted override values file, e.g. `values_local.yaml`.
You can choose if you want to use the chart's harbor, or you external harbor instance.


## Storage
The chart will use whichever storage class is the default in your cluster, unless you specify otherwise in the values. See `/charts/third-party/openebs` for instructions how to setup Mayastor Storage Replication. This requires 3+ nodes in your cluster and will replicate persistant volumes accross them.


## Ingress
See the `values.yaml` for ingress options. The default ingress configuration will use path-based routing for all services except Harbor (which requires its own hostname). You will have to provide an extra (sub)domain if you want to use the harbor component of this chart.
The ingress resources provided generally only provide HTTP listeners. The `publicHttps` field in the values just specifies if public URLs will be constructed using the `https://` prefix.

## Gateway API
This chart supports [Gateway API](https://gateway-api.sigs.k8s.io/) as an alternative to Ingress. It is designed for use with [F5 NGINX Gateway Fabric](https://docs.nginx.com/nginx-gateway-fabric/install/helm/#install-from-the-oci-registry) but may work with other Gateway controllers.

See the [FLAME Hub Deployment Guide](https://github.com/PrivateAIM/hub-deployment) for instructions on installing NGINX Gateway Fabric and configuring Gateway API.

### Enabling Gateway API

Set `global.flameHub.gatewayApi.enabled: true` along with required values or set each service's `gatewayApi.enabled` field to `true`.

### Key Differences from Ingress

- While `global.flameHub.gatewayApi.enabled` enables gatewayApi for all services, the per-service configuration (domain, path) is still done in each service's values section.
- If you are using NGF and have `nginxGatewayFabric.snippets` enabled in the `global.flameHub` section, the correct proxy parameters will be set. Otherwise, please use the annotations field to achieve the same configuration, or else the Hub will not be usable.
- Unlike ingress-nginx, Gateway Controllers usually expose a LoadBalancer Service. If you want to expose your cluster directly, extra steps are necessary.


## Credentials
> 🔐 **By default** this chart generates random passwords on install.

The chart manages credentials in three Kubernetes Secrets. On install it reuses each Secret if
it already exists, otherwise it creates it with random values. Each Secret can be overridden — set
individual values in `values.yaml`, rename it, or bring your own pre-populated Secret.

| Secret | Type | Keys | Rename / bring your own |
| --- | --- | --- | --- |
| `flame-hub-auth` | `Opaque` | `rabbitmq-password`, `redis-password`, `grafana-admin-password`, `authup-admin-password`, `authup-client-secret`, `redis-connection-string`, `rabbitmq-connection-string` | `auth.secretName` / `auth.existingSecret` |
| `flame-hub-pg` | `kubernetes.io/basic-auth` | `username`, `password` (also read by Harbor's DB and the authup subchart) | `global.flameHub.postgresql.secretName` / `.existingSecret` |
| `flame-hub-harbor` | `Opaque` | `harbor-admin-password`, `secretKey` (exactly 16 chars — goharbor requirement; encrypts robot tokens and replication creds, so it must survive upgrades), `harbor-connection-string` | `harbor.secretName` / `harbor.existingSecret` |

`secretName` renames the chart-managed Secret (still auto-populated). `existingSecret` instead makes
the chart **read** a Secret you created beforehand — nothing is generated, so it must already contain
every key above.

### Accessing an auto-generated credential

For example, the Harbor admin password:

```bash
kubectl get secret flame-hub-harbor -o jsonpath='{.data.harbor-admin-password}' | base64 -d && echo
```
View the default admin password for the FLAME Hub with:
```bash
kubectl get secret flame-hub-auth -o jsonpath='{.data.authup-admin-password}' | base64 -d && echo
```

> **Note:** If authentication in the WebUI fails, make sure your browser trusts the TLS certificate of the page.

> **Note:** The chart-managed Secrets carry `helm.sh/resource-policy: keep`, so they are not removed on `helm uninstall` — the same lifecycle as the retained PVCs.

## Running Multiple Releases in the Same Namespace

Most resources are release-scoped (prefixed with the release name), so several installs can normally coexist in one namespace. **However, some subcharts cannot template values, so we need to provide them with hardcoded ones.** For example, the goharbor chart cannot template its Postgres service name and secret name. The FLAME-Hub comes with working defaults, but running multiple instances in one namespace requires action.

You must give each release its own value for:

| Value | Default | What it names |
| --- | --- | --- |
| `global.flameHub.postgresql.host` | `postgresql` | The headless PostgreSQL Service |
| `global.flameHub.postgresql.secretName` | `flame-hub-pg` | The chart-managed PostgreSQL credential Secret |
| `harbor.expose.clusterIP.name` | `harbor` | The in-cluster Harbor Service (goharbor cannot template it; `harbor.internalHost` reads it) |
| `harbor.database.external.host` | `postgresql` | Harbor's DB host — **must match** `global.flameHub.postgresql.host` |
| `harbor.database.external.existingSecret` | `flame-hub-pg` | Harbor's DB secret — **must match** the effective PostgreSQL secret |
| `auth.secretName` | `flame-hub-auth` | central chart secret for other service credentials |
| `authup.auth.existingSecret` | `flame-hub-auth` | subchart reference — **must match** `auth.secretName` |
| `rabbitmq.auth.existingPasswordSecret` | `flame-hub-auth` | subchart reference — **must match** `auth.secretName` |
| `redis.auth.existingSecret` | `flame-hub-auth` | subchart reference — **must match** `auth.secretName` |
| `grafana.admin.existingSecret` | `flame-hub-auth` | subchart reference — **must match** `auth.secretName` |
| `harbor.secretName` | `flame-hub-harbor` | Harbor's own credentials Secret (admin password, core `secretKey`, connection string) |
| `harbor.existingSecretAdminPassword` | `flame-hub-harbor` | subchart reference — **must match** `harbor.secretName` |
| `harbor.existingSecretSecretKey` | `flame-hub-harbor` | subchart reference — **must match** `harbor.secretName` |

If you bring your own PostgreSQL Secret via `global.flameHub.postgresql.existingSecret`, that name must be unique per release too, and Harbor's `database.external.existingSecret` must point at the same secret. The Secret must contain both a `username` and a `password` key (goharbor reads the `password` key directly).

## Installing the FLAME Hub Chart

### 1. Option: Official Chart Repo
```bash
helm repo add flame https://PrivateAIM.github.io/helm
helm repo update
```
Create your custom values file (see the [chart's README](https://github.com/PrivateAIM/helm/tree/master/charts/flame-hub))
```bash
helm install <release-name> -f <values-file> flame/hub
```

### 2. Option: Chart Source Code
> Choose this option if you want to
>
> a) modify not only the chart values, but also the chart files.
>
> b) run the newest, not yet released version of the chart.
```bash
git clone https://github.com/PrivateAIM/helm.git
cd helm
```

```bash
cd charts/flame-hub
```
Create your custom values file or copy the suggested minimal example.
> **Storage Replication (optional)** see the comments regarding mayastor in `values.yaml` on how to configure your values file for storage replication

```bash
cp values_min.yaml <my-custom-values-file>
```
Install the Chart with the custom values file.

```bash
helm install <release-name> -f <my-custom-values-file> .
```