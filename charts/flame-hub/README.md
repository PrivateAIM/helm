# FLAME Hub Helm Chart
The FLAME Hub Chart provides a default configuration in `values.yaml` but is meant to be installed with your own adjusted override values file, e.g. `values_local.yaml`.
You can choose if you want to use the chart's harbor, or you external harbor instance.


## Storage
The chart will use whichever storage class is the default in your cluster, unless you specify otherwise in the values. See `/charts/third-party/openebs` for instructions how to setup Mayastor Storage Replication. This requires 3+ nodes in your cluster and will replicate persistant volumes accross them.


## Ingress
See the `values.yaml` for ingress options. The default ingress configuration will use path-based routing for all services except Harbor (which requires its own hostname). You will have to provide an extra (sub)domain if you want to use the harbor component of this chart.


## Credentials
> 🔐 **By default** this chart will create a new secret with random passwords.

This chart manages credentials using a Kubernetes Secret. By default, it will check for an existing secret named `flame-hub-auth`. If it does not exist, it will create a new secret with random passwords. You can override this behavior by providing your own k8s secret or by explicitly setting individual credentials in the values.

### Accessing auto-generated credentials
For example: View the harbor admin password with:

```bash
kubectl get secret flame-hub-auth -o jsonpath='{.data.harbor-admin-password}' | base64 -d && echo
```

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
mysql-root-password:
mysql-replication-password:
mysql-password:
rabbitmq-password:
redis-password:
vault-dev-root-token:
minio-root-password:
harbor-admin-password:
grafana-admin-password:
redis-connection-string:
rabbitmq-connection-string:
vault-connection-string:
minio-connection-string:
harbor-connection-string:
```
Create a secret:
```bash
kubectl create secret generic flame-hub-auth \
  --from-literal=mysql-root-password=verysecurepassword \
  --from-literal=harbor-admin-password=anothersecurepassword \
  # ...
```

## Minimal configuration

create `values_local.yaml` then run `helm install hub . -f values_local.yaml`

```
global:
  flameHub:
    ingress:
      enabled: true
      ssl: true
      hostname: "hub.local"

image:
  registry: ghcr.io
  repository: privateaim/hub
  tag: "latest"
  pullPolicy: Always

grafana:
  # disable plugins until plugin issues are fixed
  plugins:


harbor:
  enabled: true
  externalURL: "https://harbor.hub.local/" # don't forget https://

```
