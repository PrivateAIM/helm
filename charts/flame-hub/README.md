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
> 🔐 **By default** this chart will create a new secret with random passwords.

This chart manages credentials using a Kubernetes Secret. By default, it will check for an existing secret named `flame-hub-auth`. If it does not exist, it will create a new secret with random passwords. You can override this behavior by providing your own k8s secret or by explicitly setting individual credentials in the values.

### Accessing auto-generated credentials
For example: View the harbor admin password with:

```bash
kubectl get secret flame-hub-auth -o jsonpath='{.data.harbor-admin-password}' | base64 -d && echo
```
View the default admin password for the FLAME Hub with:
```bash
kubectl get secret flame-hub-auth -o jsonpath='{.data.authup-admin-password}' | base64 -d && echo
```

> **Note:** If authentication in the WebUI fails, make sure your browser trusts the TLS certificate of the page.

### Using an Existing Secret or changing the secret name

You can configure the secret name in `values.yaml`:

```yaml
auth:
  secretName: "my-custom-secret"
```
Alternatively, you can provide a **pre-existing secret** with:

```yaml
auth:
  existingSecret: "my-custom-secret"
```
The difference is that `existingSecret` is not populated with values from the chart or auto-generated. All credentials have to be provided beforehand.

### Creating the secret

The chart requires a secret with the following keys:

```
postgresql-password:
postgresql-replication-password:
rabbitmq-password:
redis-password:
minio-root-password:
minio-root-user:
harbor-admin-password:
grafana-admin-password:
authup-admin-password:
postgresql-connection-string:
redis-connection-string:
rabbitmq-connection-string:
minio-connection-string:
harbor-connection-string:
client-secret:
```
Create a secret:
```bash
kubectl create secret generic flame-hub-auth \
  --from-literal=postgresql-password=verysecurepassword \
  --from-literal=harbor-admin-password=anothersecurepassword \
  # ...
```

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