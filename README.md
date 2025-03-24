# Flame: Helm Repository 📦

This repository contains helm charts for FLAME.

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
the latest versions of the packages.  You can then run `helm search repo
<alias>` to see the charts.

To install the <chart-name> chart:

    helm install <chart-name> flame/<chart-name>

To uninstall the chart:

    helm delete <chart-name>
