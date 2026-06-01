# Changelog

## [0.1.0](https://github.com/PrivateAIM/helm/compare/flame-hub-0.0.11...flame-hub-0.1.0) (2026-06-01)


### Features

* **authup:** Add image configuration for authup service in values.yaml and deployment template ([89aaa6c](https://github.com/PrivateAIM/helm/commit/89aaa6cb10c0bcb2957b2772d55c6a1307c44092))
* external gateway option ([#129](https://github.com/PrivateAIM/helm/issues/129)) ([c6ae564](https://github.com/PrivateAIM/helm/commit/c6ae5647fc3942238e22ab47771d628a18eb972b))
* **gateway:** add certificateRefNamespace support for TLS configuration ([38f67cb](https://github.com/PrivateAIM/helm/commit/38f67cb66fd750f1e3fe4b71f39b0af40b9f1b28))
* **hub:** add PUBLIC_URL environment variable to server core deployment ([d6c3183](https://github.com/PrivateAIM/helm/commit/d6c3183f8353d216278e7a1570af2b836af24232))
* **hub:** make replica count configurable for client UI ([#134](https://github.com/PrivateAIM/helm/issues/134)) ([0e049a3](https://github.com/PrivateAIM/helm/commit/0e049a38bc68b5731ae0fd9c033ca9c531251319))
* **hub:** Support Gateway API and provide gateway template with necessary nginx parameters ([#118](https://github.com/PrivateAIM/helm/issues/118)) ([9954b2a](https://github.com/PrivateAIM/helm/commit/9954b2a9cb794135cd21cd84ee63f3d51ce72cef))


### Bug Fixes

* Hub chart dependency authup bumped to 0.0.11 ([2409053](https://github.com/PrivateAIM/helm/commit/2409053d81e36ac75583790f74bd9093b1d3db7a))
* **hub:** appropriate pod update strategy for harbor RWO PVCs ([37da737](https://github.com/PrivateAIM/helm/commit/37da737907690e2e5f2d34bcead720013c15c8db))
* **hub:** load grafana VL plugin through extra env instead of chart value plugins. ([#132](https://github.com/PrivateAIM/helm/issues/132)) ([7ad228a](https://github.com/PrivateAIM/helm/commit/7ad228a0f0fb3985160382bfed55bf27d0f314e6))
* **hub:** Persist Docker Images and Master Images Repo for Hub Core W… ([#122](https://github.com/PrivateAIM/helm/issues/122)) ([d1d2bed](https://github.com/PrivateAIM/helm/commit/d1d2beda60e103a82e682bb739567d8c081ecd69))
* **hub:** pvc mount path for master-images repo, pvc resource policy keep ([26863a5](https://github.com/PrivateAIM/helm/commit/26863a598db0f85075c89644525d515c3f16accd))

## [0.0.11](https://github.com/PrivateAIM/helm/compare/flame-hub-0.0.10...flame-hub-0.0.11) (2026-03-25)


### Features

* hub: example values file, improved values comments, better readme ([#114](https://github.com/PrivateAIM/helm/issues/114)) ([7b9a729](https://github.com/PrivateAIM/helm/commit/7b9a7297810c8d07f47726a5b4a31dfbc3d70617))
* **hub:** Ingress controller independent ingress resources & merge root and hub sub path ingress ([#105](https://github.com/PrivateAIM/helm/issues/105)) ([588eeac](https://github.com/PrivateAIM/helm/commit/588eeac02099286305d2b2833d487191c9aa4df4))
* **hub:** use kubernetes secrets to store credentials ([#107](https://github.com/PrivateAIM/helm/issues/107)) ([d88ef7a](https://github.com/PrivateAIM/helm/commit/d88ef7abe8b60c6d210b18ea40b989b55f9a7bb8))
* **hub:** use single postgresql instance ([#112](https://github.com/PrivateAIM/helm/issues/112)) ([a352c79](https://github.com/PrivateAIM/helm/commit/a352c7973222e0932a858e752d6bcaf81843ef27))
* integrate Harbor ([#86](https://github.com/PrivateAIM/helm/issues/86)) ([dd1ac29](https://github.com/PrivateAIM/helm/commit/dd1ac2939e91dd0e80209a9fd854b97c1c6978d8))
* replace loki with victorialogs ([#89](https://github.com/PrivateAIM/helm/issues/89)) ([ff37fb6](https://github.com/PrivateAIM/helm/commit/ff37fb64181e8ced3f93385b07473fa1fe024fbf))
* replace mysql vs postgresql ([#109](https://github.com/PrivateAIM/helm/issues/109)) ([26a74b4](https://github.com/PrivateAIM/helm/commit/26a74b4bf1a17f207a567cb5264e7431fdac11a5))
* replace robot with client authentication/authroization ([#111](https://github.com/PrivateAIM/helm/issues/111)) ([29b2f5a](https://github.com/PrivateAIM/helm/commit/29b2f5a6924167df910d6205c212444d605bd88f))
* storage replication with mayastor ([#100](https://github.com/PrivateAIM/helm/issues/100)) ([b2fa83d](https://github.com/PrivateAIM/helm/commit/b2fa83d0bc25fb213945efc5d5f6fcfd7291ccd9))


### Bug Fixes

* adjust server-{messenger,storage} entrypoint command ([12b9277](https://github.com/PrivateAIM/helm/commit/12b927776fca53a807aa400733b1f00c188cfc58))
* adjust startup timeouts to prevent crashes with slow storage bac… ([0ea80ef](https://github.com/PrivateAIM/helm/commit/0ea80efe9489dfea7db59a5a85b4490b71728528))
* adjust startup timeouts to prevent crashes with slow storage backends ([4458554](https://github.com/PrivateAIM/helm/commit/44585540f10a073017b59fa3a788040365d90429))
* check if harbor.host is not empty ([26a4967](https://github.com/PrivateAIM/helm/commit/26a49678c0c8aac9914142ac4d2747f083170f75))
* further increase buffer size ([5097fa6](https://github.com/PrivateAIM/helm/commit/5097fa6b7ec6aafd76b2ddb6862ae347b76ab9e4))
* hub template syntax error ([f05d0ae](https://github.com/PrivateAIM/helm/commit/f05d0aea98ca716731acd40c609a99730cc2ebe6))
* increase authup ingress buffer size ([b4ca107](https://github.com/PrivateAIM/helm/commit/b4ca10771e69e41091188f583fc54329dac674e3))
* increase ingress buffer size; fixes 502 Error when requesting token from auth service ([#92](https://github.com/PrivateAIM/helm/issues/92)) ([bd9dada](https://github.com/PrivateAIM/helm/commit/bd9dada672e82680cb9c97b6fb629e7b7bfc12b9))
* only specify dnd insecure-registry if host is defined ([4fdf09e](https://github.com/PrivateAIM/helm/commit/4fdf09e8dc4cc57460753d63ba4f2c1f2392263d))
* postgres instances conflicting ([e56308b](https://github.com/PrivateAIM/helm/commit/e56308b6efb5c8f1d8efc023dfc48b23ca2969ff))
* remove dead comments in values (that were meant for harbor secrets but are not necessary) ([655c4a6](https://github.com/PrivateAIM/helm/commit/655c4a6a5a643195c3017d3ab4e95e3bf60ba84d))

## [0.0.10](https://github.com/PrivateAIM/helm/compare/flame-hub-0.0.9...flame-hub-0.0.10) (2025-11-21)


### Miscellaneous Chores

* **flame-hub:** Synchronize global versions

## [0.0.9](https://github.com/PrivateAIM/helm/compare/flame-hub-0.0.8...flame-hub-0.0.9) (2025-10-16)


### Miscellaneous Chores

* **flame-hub:** Synchronize global versions
