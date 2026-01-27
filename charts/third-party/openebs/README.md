# OpenEBS/Mayastor for FLAME
This chart is a wrapper around the official OpenEBS chart and brings a default configuration suitable for FLAME.
Installing this chart will add a StorageClass to your cluster. You can tell workloads of the Flame Hub to use this Storage Class, by specifying it in `flame-hub/values.yaml`

1. Clone `values.yaml` to `values_local.yaml`.
2. Fill in your kubelet path and populate the disk pools section with your unmounted drives.
3. Install the chart:

Note: Go to this directory first
```
helm dependency update .
```
```
helm install openebs . --namespace openebs --create-namespace -f values_local.yaml
```

4. Verify disk pools and `mayastor` storage classes:
```
kubectl get diskpools -n openebs
```
Note: Disk Pools may need 1-5 minutes to be ready
```
kubectl get storageclasses
```