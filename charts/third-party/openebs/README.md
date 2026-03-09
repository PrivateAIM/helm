# OpenEBS/Mayastor for FLAME
This chart is a wrapper around the official OpenEBS chart and brings a default configuration suitable for FLAME.
Installing this chart will add a StorageClass to your cluster. You can tell workloads of the Flame Hub to use this Storage Class, by specifying it in `flame-hub/values.yaml`

1. Make sure you have 3 nodes in your cluster
2. Label them all using `kubectl label node <node_name> openebs.io/engine=mayastor`
3. Clone `values.yaml` to `values_local.yaml`.
4. Fill in your kubelet path (see comment in yaml).
5. Install the chart:

Note: Go to this directory first
```bash
helm dependency update .
```
**Important** On the first Helm Install, do not specify any diskpools yet. The Openebs chart needs to first create the Custom Resource Definition `diskpools.openebs.io` before we can add diskpools. **This may take a couple of minutes**. Check with `kubectl get crd` after installing openebs.
```bash
helm install openebs . --namespace openebs --create-namespace -f values_local.yaml
```
6. Add Diskpools
Fill in your diskpools in your values-file and upgrade the Helm Release.
**Important considerations**
- Each pool needs an unmounted disk/partition
- Reference disks by `/dev/disk/by-partuuid/xxx` instead of `/dev/vdx`
```bash
helm upgrade openebs . --namespace openebs -f values_local.yaml
```

7. Verify disk pools and `mayastor` storage classes:
```bash
kubectl get diskpools -n openebs
```
Note: Disk Pools may need 1-5 minutes to be ready
```bash
kubectl get storageclasses
```
8. (optional) Install [Mayastor kubectl Plugin](https://openebs.io/docs/main/user-guides/replicated-storage-user-guide/replicated-pv-mayastor/advanced-operations/kubectl-plugin)

9. (optional) If you need to remove pools, use the mayastor kubectl plugin to drain them first.

Now your cluster is ready to use the StorageClass `mayastor-replicated`