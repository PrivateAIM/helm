# flame-provisioner (internal)

This chart is intentionally internal deployment infrastructure.  It is consumed by Flux from the
Helm Git repository and is neither a public FLAME chart nor a release-please package.

`Chart.yaml` owns the Hub Seeder compatibility pin. To update it:

1. Release Hub Seeder and confirm `ghcr.io/privateaim/hub-seeder:<version>` exists.
2. Change the quoted `appVersion` to the compatible release.
3. Bump `version` for every pin, template, default, or contract change.
4. Include any related Hub or Node compatibility change in the same Helm PR.

Fleet uses `reconcileStrategy: ChartVersion`; an unrelated commit to its source branch will not
rerun the provisioning hooks.
