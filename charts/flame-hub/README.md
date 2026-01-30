# FLAME Hub Helm Chart
The FLAME Hub Chart provides a default configuration in `values.yaml` but is meant to be installed with your own adjusted override values file, e.g. `values_local.yaml`.
You can choose if you want to use the chart's harbor, or you external harbor instance.

## Storage
The chart will use whichever storage class is the default in your cluster, unless you specify otherwise in the values. See `/charts/third-party/openebs` for instructions how to setup Mayastor Storage Replication. This requires 3+ nodes in your cluster and will replicate persistant volumes accross them.

## Ingress
See the `values.yaml` for ingress options. The default ingress configuration will use path-based routing for all services except Harbor (which requires its own hostname). You will have to provide an extra (sub)domain if you want to use the harbor component of this chart.


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

serverCore:
  env:
    masterImagesBranch: "master"
  harbor:
    username: "admin"
    password: "start123"

harbor:
  enabled: true
  adminUsername: "admin"
  adminPassword: "start123"
  externalURL: "https://harbor.hub.local/" # don't forget https://

```

## Minimal Configuration using 3 nodes and Mayastor
(Also see `/charts/third-party/openebs/README.md`)

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

minio:
  persistence:
    storageClass: "mayastor-replicated"

rabbitmq:
  persistence:
    storageClass: "mayastor-replicated"

grafana:
  # disable plugins until plugin issues are fixed
  plugins:
  persistence:
    storageClass: "mayastor-replicated"

serverCore:
  env:
    masterImagesBranch: "master"
  harbor:
    username: "admin"
    password: "start123"

harbor:
  enabled: true
  adminUsername: "admin"
  adminPassword: "start123"
  externalURL: "https://harbor.hub.local/" # don't forget https://
  persistence:
    persistentVolumeClaim:
      registry:
        storageClass: "mayastor-replicated"

```

## Deployment

### Windows

```shell
cd scripts
```

Open PowerShell as Administrator
```shell
powershell -ExecutionPolicy Bypass -File .\minikube-dns.ps1 <hubURL> <harborURL>
```
