# Changelog

## [0.2.0](https://github.com/PrivateAIM/helm/compare/authup-0.1.0...authup-0.2.0) (2026-08-11)


### Features

* **authup:** pass TRUSTED_ORIGINS to server-core, defaulting to t… ([#143](https://github.com/PrivateAIM/helm/issues/143)) ([c95e160](https://github.com/PrivateAIM/helm/commit/c95e160b291bf7768f10c3fae04c2cc799b12025))
* **authup:** provision permissions, roles and registry client via authup provisioning ([#152](https://github.com/PrivateAIM/helm/issues/152)) ([d7fd514](https://github.com/PrivateAIM/helm/commit/d7fd514e0e875558da53f2fb690e3bd69c58893f))
* **flame-hub:** prepare postgres service and secret config for the upcoming migration to goharbor ([660b4bf](https://github.com/PrivateAIM/helm/commit/660b4bf9391b4f62731a270999b838d9e4450bd1))
* **hub:** tune startup and readiness probes of flame hub services ([#144](https://github.com/PrivateAIM/helm/issues/144)) ([42e565a](https://github.com/PrivateAIM/helm/commit/42e565a357591ed1ccc4f83fde2ce028b3aeead1))
* use postres user from secret for consistency ([454174b](https://github.com/PrivateAIM/helm/commit/454174bc37b3acfd0123032f888a83e0148b123e))

## [0.1.0](https://github.com/PrivateAIM/helm/compare/authup-0.0.11...authup-0.1.0) (2026-06-01)


### Features

* **authup:** Add image configuration for authup service in values.yaml and deployment template ([89aaa6c](https://github.com/PrivateAIM/helm/commit/89aaa6cb10c0bcb2957b2772d55c6a1307c44092))


### Bug Fixes

* **authup:** remove double repository ([5de1225](https://github.com/PrivateAIM/helm/commit/5de1225de389489ef90a34f3cccdac8fd7be50e0))

## [0.0.11](https://github.com/PrivateAIM/helm/compare/authup-0.0.10...authup-0.0.11) (2026-03-25)


### Features

* **hub:** Ingress controller independent ingress resources & merge root and hub sub path ingress ([#105](https://github.com/PrivateAIM/helm/issues/105)) ([588eeac](https://github.com/PrivateAIM/helm/commit/588eeac02099286305d2b2833d487191c9aa4df4))
* **hub:** use kubernetes secrets to store credentials ([#107](https://github.com/PrivateAIM/helm/issues/107)) ([d88ef7a](https://github.com/PrivateAIM/helm/commit/d88ef7abe8b60c6d210b18ea40b989b55f9a7bb8))
* integrate Harbor ([#86](https://github.com/PrivateAIM/helm/issues/86)) ([dd1ac29](https://github.com/PrivateAIM/helm/commit/dd1ac2939e91dd0e80209a9fd854b97c1c6978d8))
* replace mysql vs postgresql ([#109](https://github.com/PrivateAIM/helm/issues/109)) ([26a74b4](https://github.com/PrivateAIM/helm/commit/26a74b4bf1a17f207a567cb5264e7431fdac11a5))
* replace robot with client authentication/authroization ([#111](https://github.com/PrivateAIM/helm/issues/111)) ([29b2f5a](https://github.com/PrivateAIM/helm/commit/29b2f5a6924167df910d6205c212444d605bd88f))


### Bug Fixes

* adjust startup timeouts to prevent crashes with slow storage bac… ([0ea80ef](https://github.com/PrivateAIM/helm/commit/0ea80efe9489dfea7db59a5a85b4490b71728528))
* adjust startup timeouts to prevent crashes with slow storage backends ([4458554](https://github.com/PrivateAIM/helm/commit/44585540f10a073017b59fa3a788040365d90429))

## [0.0.10](https://github.com/PrivateAIM/helm/compare/authup-0.0.9...authup-0.0.10) (2025-11-21)


### Miscellaneous Chores

* **authup:** Synchronize global versions

## [0.0.9](https://github.com/PrivateAIM/helm/compare/authup-0.0.8...authup-0.0.9) (2025-10-16)


### Miscellaneous Chores

* **authup:** Synchronize global versions
