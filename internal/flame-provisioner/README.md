# flame-provisioner (internal)

This chart is intentionally internal deployment infrastructure. It is consumed by Flux from the
Helm Git repository and is not a public FLAME chart: `hevi` publishes only what lives under
`charts/`, so nothing here is ever packaged or pushed to the chart index.

## Versions

The two version fields have different owners:

- **`version`** is owned by release-please and is kept in lockstep with `flame-hub`, `flame-node`
  and the repository version through the `linked-versions` plugin. Do not hand-edit it; every
  release of this repository moves it, whether or not this chart changed.
- **`appVersion`** is the Hub Seeder compatibility pin and is the one field to edit by hand.
  release-please's Helm strategy rewrites `version` only, so the pin survives a release untouched.

To move the pin:

1. Release Hub Seeder and confirm `ghcr.io/privateaim/hub-seeder:<version>` exists.
2. Change the quoted `appVersion` to the compatible release.
3. Include any related Hub or Node compatibility change in the same Helm PR.

Because the chart version now moves with every repository release, fleet re-runs the provisioning
hooks after a release even when this chart did not change. That is deliberate and safe: node
provisioning keeps the credentials a node already holds (see below), so a re-run is a no-op rather
than a rotation.

## Node credential handling

Node mode is safe to re-run: `hub-seeder` keeps the node's existing key pair and reads its Authup
client secret back rather than issuing new ones, so a hook re-run does not invalidate the
credentials the node is running with.
Set `node.rotateCredentials: true` to issue a new key pair and client secret instead.
