# Flame: Helm Repository 📦

This repository contains all helm charts for FLAME.

> 🚧 **Work in Progress**
>
> The helm repository is currently under active development and is not yet ready for production.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```shell
helm repo add flame https://PrivateAIM.github.io/helm
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo flame` to see the charts.

To install the <chart-name> chart:

```shell
helm install <release-name> flame/<chart-name>
```

To install the <chart-name> chart with values file:

```shell
helm install <release-name> -f <values-file> flame/<chart-name>
```

To uninstall the chart:
```shell
helm delete <release-name>
```

### Hub

To install the hub chart:
```shell
helm install <release-name> flame/flame-hub
```

### Node

To install the node chart:
```shell
helm install <release-name> flame/flame-node
```


