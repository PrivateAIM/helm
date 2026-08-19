# Changelog

## [0.2.1](https://github.com/PrivateAIM/helm/compare/root-0.2.0...root-0.2.1) (2026-08-19)


### Features

* **hub:** theme the authup consoles with the hub design ([fd85d42](https://github.com/PrivateAIM/helm/commit/fd85d42f5dffc5bd6534a967e273683124d37de4))

## [0.2.0](https://github.com/PrivateAIM/helm/compare/root-0.1.0...root-0.2.0) (2026-08-11)


### ⚠ BREAKING CHANGES

* **flame-hub:** migrate harbor from bitnami to goharbor chart
* **flame-node:** working node seaweedfs and updated values_min
* **flame-node:** working node seaweedfs and updated values_min

### Features

* add database configuration for messenger ([cb0037a](https://github.com/PrivateAIM/helm/commit/cb0037a6c13f2b9a79d58143e48ea758a5b7c0f7))
* **authup:** pass TRUSTED_ORIGINS to server-core, defaulting to t… ([#143](https://github.com/PrivateAIM/helm/issues/143)) ([c95e160](https://github.com/PrivateAIM/helm/commit/c95e160b291bf7768f10c3fae04c2cc799b12025))
* **authup:** provision permissions, roles and registry client via authup provisioning ([#152](https://github.com/PrivateAIM/helm/issues/152)) ([d7fd514](https://github.com/PrivateAIM/helm/commit/d7fd514e0e875558da53f2fb690e3bd69c58893f))
* **flame-hub:** migrate harbor from bitnami to goharbor chart ([2cfc29f](https://github.com/PrivateAIM/helm/commit/2cfc29f5f050de1425d12457478d041fea1a0406))
* **flame-hub:** prepare postgres service and secret config for the upcoming migration to goharbor ([660b4bf](https://github.com/PrivateAIM/helm/commit/660b4bf9391b4f62731a270999b838d9e4450bd1))
* **flame-hub:** replace bitnami postgresql subchart with self-hosted postgres ([7ecdbb7](https://github.com/PrivateAIM/helm/commit/7ecdbb7ace6ed78c08bf8802f5605f6b758175aa))
* **flame-node:** v1 of seaweedfs ([1feaa67](https://github.com/PrivateAIM/helm/commit/1feaa671c144d54489005723e6bb4d765b7cf711))
* **flame-node:** v1 of seaweedfs ([ded1f20](https://github.com/PrivateAIM/helm/commit/ded1f20338c0e709c896fa140c53e4bf485e860e))
* **flame-node:** working node seaweedfs and updated values_min ([3fb3cad](https://github.com/PrivateAIM/helm/commit/3fb3cad6658f6b32ab5e2d77cbd01e3e4870ea31))
* **flame-node:** working node seaweedfs and updated values_min ([386d5c8](https://github.com/PrivateAIM/helm/commit/386d5c87d123452a7a89b6ec1d41f66158f9ab8c))
* **hub:** separate harbor secret from main chart secret, generate random harbor "secretKey" in addition to password ([751a1c7](https://github.com/PrivateAIM/helm/commit/751a1c7a9a8f084735eefe407600e4395fe64a38))
* **hub:** tune startup and readiness probes of flame hub services ([#144](https://github.com/PrivateAIM/helm/issues/144)) ([42e565a](https://github.com/PrivateAIM/helm/commit/42e565a357591ed1ccc4f83fde2ce028b3aeead1))
* **mb:** add node message broker service port for health checks ([30db93a](https://github.com/PrivateAIM/helm/commit/30db93abec10bf90542f01620b14a845c947e0d2))
* **node:** add conditional httproute for seaweedfs ([e6adcd9](https://github.com/PrivateAIM/helm/commit/e6adcd966623b287770374984e971f9a00e968be))
* **node:** add conditional httproute for seaweedfs ([e165f97](https://github.com/PrivateAIM/helm/commit/e165f978669d1c023353ecf3f41b28005e1c4680))
* **node:** make nuxt auth secret persist between upgrades ([23d550d](https://github.com/PrivateAIM/helm/commit/23d550d651d87048188dbad762cb1dbdc8b859a4))
* **openebs:** tune mayastor settings and disable unused openebs hostpath storage class ([580dc1d](https://github.com/PrivateAIM/helm/commit/580dc1d5262c8f37c4570989b4e0bcd2a68e14f6))
* use postres user from secret for consistency ([454174b](https://github.com/PrivateAIM/helm/commit/454174bc37b3acfd0123032f888a83e0148b123e))


### Bug Fixes

* **flame-node:** allow keycloak to start when expose type is none ([e5af584](https://github.com/PrivateAIM/helm/commit/e5af5840959aaa64ea8c147891dcccd2af89535f))
* **flame-node:** disable seaweedfs CR ([1de5f2f](https://github.com/PrivateAIM/helm/commit/1de5f2fcfd256b99fd0e3c86b47ba39a87c014c2))
* **flame-node:** disable seaweedfs CR ([720a7c7](https://github.com/PrivateAIM/helm/commit/720a7c73b486bf8458665cd645be9f1bb15a6cdc))
* **flame-node:** enable manually setting KC service secrets ([ea79496](https://github.com/PrivateAIM/helm/commit/ea7949607bf9b986c31e7a465c1637488ddc9088))
* **flame-node:** harden security contexts with numerical non-root users for third party images ([72456d7](https://github.com/PrivateAIM/helm/commit/72456d7872c2b081c506b360f50802bcce9ad50f))
* **flame-node:** helper functions apply https when tls provided ([fedb6c5](https://github.com/PrivateAIM/helm/commit/fedb6c55f80bcd89a0e69a5040888fbd1f8fcf17))
* **flame-node:** move secret separators within if blocks ([d0b4f24](https://github.com/PrivateAIM/helm/commit/d0b4f2408b205eb606d5bfd5180c0d6ec15c3634))
* **flame-node:** set seaweed admin credentials in values ([9505cae](https://github.com/PrivateAIM/helm/commit/9505cae37ba039752b851e69faa27cb5c5bb458c))
* **flame-node:** set seaweed admin credentials in values ([e7df924](https://github.com/PrivateAIM/helm/commit/e7df9242315927f8247f8a16aee98411ad85e34d))
* **hub:** implement the rabbit's suggestions: helper improvement, README clarity ([#168](https://github.com/PrivateAIM/helm/issues/168)) ([ac082b3](https://github.com/PrivateAIM/helm/commit/ac082b3d22bf74ec6f60114ff4d98eec571210cd))
* **hub:** increase seaweedFS maxVolumes number and volumeSizeLimitMB to 2G ([#155](https://github.com/PrivateAIM/helm/issues/155)) ([e79895e](https://github.com/PrivateAIM/helm/commit/e79895eed4406f4e3648a55c3b063af91fa4ab86))
* **hub:** reduce write events on new seaweed buckets ([dbe113b](https://github.com/PrivateAIM/helm/commit/dbe113bad9d6f85658a681ff6a4f350dc01b3b89))
* **hub:** remove orphan line of code in harbor secret ([884c3da](https://github.com/PrivateAIM/helm/commit/884c3dadf931ebd642ac4d44dfed637cbfff1183))
* **node:** avoid conflicting seaweed SAs ([c774be8](https://github.com/PrivateAIM/helm/commit/c774be800390d4e2a01a9f1ed4103c9c4121ca6c))
* **node:** avoid conflicting seaweed SAs ([98d14d4](https://github.com/PrivateAIM/helm/commit/98d14d4983d6a5c086b53d7f29dcd574513f1b6a))
* **node:** use standard value naming schema ([f745ba8](https://github.com/PrivateAIM/helm/commit/f745ba8e154ca22c04037ee664fcbb916a121942))
* postgres statefulset use username from BYO secret ([f77daf2](https://github.com/PrivateAIM/helm/commit/f77daf294d1b2798916993aaad388d6bbddbbed4))
* remove upgrade transition mechanism in PG secret. The secret must be pre-created anyway in all instances that have harbor (because of habor pre-upgrade hooks) ([7f28a98](https://github.com/PrivateAIM/helm/commit/7f28a98188a7a18e889cedec09dcedb718e982ee))


### Performance Improvements

* **flame-node:** simplify seaweed inetgration ([717652c](https://github.com/PrivateAIM/helm/commit/717652c016f53e050b5d7ae5ae17ee87b9ec099b))
* **flame-node:** simplify seaweed inetgration ([ede43da](https://github.com/PrivateAIM/helm/commit/ede43dadeba8b8abe232d88f3919af72040a15b9))

## [0.1.0](https://github.com/PrivateAIM/helm/compare/root-0.0.11...root-0.1.0) (2026-06-01)


### ⚠ BREAKING CHANGES

* harden flame-node chart security
* allow passing proxy info as secret in flame-node

### Features

* allow passing proxy info as secret in flame-node ([cb9629a](https://github.com/PrivateAIM/helm/commit/cb9629a5010a841b3331dee6cfc9bf32a9b91398))
* **authup:** Add image configuration for authup service in values.yaml and deployment template ([89aaa6c](https://github.com/PrivateAIM/helm/commit/89aaa6cb10c0bcb2957b2772d55c6a1307c44092))
* external gateway option ([#129](https://github.com/PrivateAIM/helm/issues/129)) ([c6ae564](https://github.com/PrivateAIM/helm/commit/c6ae5647fc3942238e22ab47771d628a18eb972b))
* **gateway:** add certificateRefNamespace support for TLS configuration ([38f67cb](https://github.com/PrivateAIM/helm/commit/38f67cb66fd750f1e3fe4b71f39b0af40b9f1b28))
* harden flame-node chart security ([e4fa99f](https://github.com/PrivateAIM/helm/commit/e4fa99fa6c0db36afc5016602874d4d6c3a825f4))
* **hub:** add PUBLIC_URL environment variable to server core deployment ([d6c3183](https://github.com/PrivateAIM/helm/commit/d6c3183f8353d216278e7a1570af2b836af24232))
* **hub:** make replica count configurable for client UI ([#134](https://github.com/PrivateAIM/helm/issues/134)) ([0e049a3](https://github.com/PrivateAIM/helm/commit/0e049a38bc68b5731ae0fd9c033ca9c531251319))
* **hub:** Support Gateway API and provide gateway template with necessary nginx parameters ([#118](https://github.com/PrivateAIM/helm/issues/118)) ([9954b2a](https://github.com/PrivateAIM/helm/commit/9954b2a9cb794135cd21cd84ee63f3d51ce72cef))
* **node:** add env vars for PO deploy for net stats ([793e119](https://github.com/PrivateAIM/helm/commit/793e11998cd4b1787d9ff031421c2abf2b1cc7df))
* **node:** add gateway api support to victorialogs ([7548a2e](https://github.com/PrivateAIM/helm/commit/7548a2e3a4b2bdfabc1e26852615b82fc9842bee))
* **node:** add keycloak secret sync job with rbac ([38778fa](https://github.com/PrivateAIM/helm/commit/38778fa768a120721c22c641e2f3cc0dd46c1ac5))
* **node:** add victoria logs to Chart.yaml and values.yaml ([0d18328](https://github.com/PrivateAIM/helm/commit/0d1832810d971ec98e85e86ffaf2ec6e425e38c8))
* **node:** allow user to set custom nuxt auth secret for node ui ([22a4b9c](https://github.com/PrivateAIM/helm/commit/22a4b9c8a4bf492ec41375ee8fb551d3daa01bef))
* **node:** log level parsing in victorialogs ([1473dd7](https://github.com/PrivateAIM/helm/commit/1473dd719de2d92b517d2f525ff145e08aa8b48c))
* **openebs:** allow volume expansion with mayastor-replicated ([96add7f](https://github.com/PrivateAIM/helm/commit/96add7f5d654b0e4afcfddc8913446fddbbcec18))


### Bug Fixes

* Add extra-files configuration for authup dependency in release-please-config.json ([d791a7a](https://github.com/PrivateAIM/helm/commit/d791a7a0ee0f73d7cd4c3d4d5294377c7e8f8450))
* **authup:** remove double repository ([5de1225](https://github.com/PrivateAIM/helm/commit/5de1225de389489ef90a34f3cccdac8fd7be50e0))
* Hub chart dependency authup bumped to 0.0.11 ([2409053](https://github.com/PrivateAIM/helm/commit/2409053d81e36ac75583790f74bd9093b1d3db7a))
* **hub:** appropriate pod update strategy for harbor RWO PVCs ([37da737](https://github.com/PrivateAIM/helm/commit/37da737907690e2e5f2d34bcead720013c15c8db))
* **hub:** load grafana VL plugin through extra env instead of chart value plugins. ([#132](https://github.com/PrivateAIM/helm/issues/132)) ([7ad228a](https://github.com/PrivateAIM/helm/commit/7ad228a0f0fb3985160382bfed55bf27d0f314e6))
* **hub:** Persist Docker Images and Master Images Repo for Hub Core W… ([#122](https://github.com/PrivateAIM/helm/issues/122)) ([d1d2bed](https://github.com/PrivateAIM/helm/commit/d1d2beda60e103a82e682bb739567d8c081ecd69))
* **hub:** pvc mount path for master-images repo, pvc resource policy keep ([26863a5](https://github.com/PrivateAIM/helm/commit/26863a598db0f85075c89644525d515c3f16accd))
* **node:** add support for gateway TLS termination ([11105ed](https://github.com/PrivateAIM/helm/commit/11105ed23c0719ae6ae79c89fbd7e45762f3a106))
* **node:** improve hostname parsing in edge cases ([6240a92](https://github.com/PrivateAIM/helm/commit/6240a925bee9a46a94436df95ef4fd702e339041))
* **node:** make use of keycloak http relativePath in URL generation ([8ba9abd](https://github.com/PrivateAIM/helm/commit/8ba9abd15a488562716800c6c617a7b5b3c53111))
* **node:** modify kc settings for upstream TLS termination ([22d77f8](https://github.com/PrivateAIM/helm/commit/22d77f898b44a14d8fa7a8eae54514e194df4696))
* **node:** update victorialogs alias names ([8beca80](https://github.com/PrivateAIM/helm/commit/8beca80956670af3d0d2fc9313d1ff321eb7d9b8))
* Update extra-files path for authup dependency in release-please-config.json ([3cce20b](https://github.com/PrivateAIM/helm/commit/3cce20ba0240d525c4552b578253930cf7d3bfee))


### Performance Improvements

* **node:** optimize ui and HA probes ([c8ef560](https://github.com/PrivateAIM/helm/commit/c8ef5600db1775a2cab6e450ae998a8bdff7845e))
* **node:** remove mogodb logs from victorialogs ([2916202](https://github.com/PrivateAIM/helm/commit/29162021fdb31b6687a1fa69861ca517555587bc))


### Reverts

* **mb:** add proxy whitelist back ([12937cd](https://github.com/PrivateAIM/helm/commit/12937cd5ce607a4754168f7437a6c12d43bc9e6d))
* **node:** revert helpers ([fa8a5ee](https://github.com/PrivateAIM/helm/commit/fa8a5ee08868201feaa2532295d1d75bd3f82139))

## [0.0.11](https://github.com/PrivateAIM/helm/compare/root-0.0.10...root-0.0.11) (2026-03-25)


### Features

* add HUB_LOGGING environment variable ([95d8309](https://github.com/PrivateAIM/helm/commit/95d8309bfc0910fa305576f0e6f750f0310fc49c))
* add workflow to sync Kong MinIO Gateway plugin from source repository ([0a14dda](https://github.com/PrivateAIM/helm/commit/0a14dda6670c4ad827a447cd4830ac92a42d221c))
* hub: example values file, improved values comments, better readme ([#114](https://github.com/PrivateAIM/helm/issues/114)) ([7b9a729](https://github.com/PrivateAIM/helm/commit/7b9a7297810c8d07f47726a5b4a31dfbc3d70617))
* **hub:** Ingress controller independent ingress resources & merge root and hub sub path ingress ([#105](https://github.com/PrivateAIM/helm/issues/105)) ([588eeac](https://github.com/PrivateAIM/helm/commit/588eeac02099286305d2b2833d487191c9aa4df4))
* **hub:** use kubernetes secrets to store credentials ([#107](https://github.com/PrivateAIM/helm/issues/107)) ([d88ef7a](https://github.com/PrivateAIM/helm/commit/d88ef7abe8b60c6d210b18ea40b989b55f9a7bb8))
* **hub:** use single postgresql instance ([#112](https://github.com/PrivateAIM/helm/issues/112)) ([a352c79](https://github.com/PrivateAIM/helm/commit/a352c7973222e0932a858e752d6bcaf81843ef27))
* integrate Harbor ([#86](https://github.com/PrivateAIM/helm/issues/86)) ([dd1ac29](https://github.com/PrivateAIM/helm/commit/dd1ac2939e91dd0e80209a9fd854b97c1c6978d8))
* **kong:** add custom minio-gateway plugin configuration ([206fd2f](https://github.com/PrivateAIM/helm/commit/206fd2f798389276f16bca6c2b1aa3af1af64bb2))
* **node:** add default roles to keycloak and update HA ([ce24387](https://github.com/PrivateAIM/helm/commit/ce243879ec87dd293e1dbc951e9d0dab48e2c357))
* **node:** add postgres env vars to hub adapter deployment ([cdadf58](https://github.com/PrivateAIM/helm/commit/cdadf586fc69809e9dee60db21e5b3e0f3e95327))
* replace loki with victorialogs ([#89](https://github.com/PrivateAIM/helm/issues/89)) ([ff37fb6](https://github.com/PrivateAIM/helm/commit/ff37fb64181e8ced3f93385b07473fa1fe024fbf))
* replace mysql vs postgresql ([#109](https://github.com/PrivateAIM/helm/issues/109)) ([26a74b4](https://github.com/PrivateAIM/helm/commit/26a74b4bf1a17f207a567cb5264e7431fdac11a5))
* replace robot with client authentication/authroization ([#111](https://github.com/PrivateAIM/helm/issues/111)) ([29b2f5a](https://github.com/PrivateAIM/helm/commit/29b2f5a6924167df910d6205c212444d605bd88f))
* storage replication with mayastor ([#100](https://github.com/PrivateAIM/helm/issues/100)) ([b2fa83d](https://github.com/PrivateAIM/helm/commit/b2fa83d0bc25fb213945efc5d5f6fcfd7291ccd9))


### Bug Fixes

* adjust server-{messenger,storage} entrypoint command ([12b9277](https://github.com/PrivateAIM/helm/commit/12b927776fca53a807aa400733b1f00c188cfc58))
* adjust startup timeouts to prevent crashes with slow storage bac… ([0ea80ef](https://github.com/PrivateAIM/helm/commit/0ea80efe9489dfea7db59a5a85b4490b71728528))
* adjust startup timeouts to prevent crashes with slow storage backends ([4458554](https://github.com/PrivateAIM/helm/commit/44585540f10a073017b59fa3a788040365d90429))
* check if harbor.host is not empty ([26a4967](https://github.com/PrivateAIM/helm/commit/26a49678c0c8aac9914142ac4d2747f083170f75))
* correct typo in enableHubLogging description for clarity ([4f931d3](https://github.com/PrivateAIM/helm/commit/4f931d398783443db4011a680d6f0046d5e19fb2))
* further increase buffer size ([5097fa6](https://github.com/PrivateAIM/helm/commit/5097fa6b7ec6aafd76b2ddb6862ae347b76ab9e4))
* hub template syntax error ([f05d0ae](https://github.com/PrivateAIM/helm/commit/f05d0aea98ca716731acd40c609a99730cc2ebe6))
* increase authup ingress buffer size ([b4ca107](https://github.com/PrivateAIM/helm/commit/b4ca10771e69e41091188f583fc54329dac674e3))
* increase ingress buffer size; fixes 502 Error when requesting token from auth service ([#92](https://github.com/PrivateAIM/helm/issues/92)) ([bd9dada](https://github.com/PrivateAIM/helm/commit/bd9dada672e82680cb9c97b6fb629e7b7bfc12b9))
* **node:** add hostname for local keycloak ([371aeca](https://github.com/PrivateAIM/helm/commit/371aecae3d22a4616d17c065d6fd2eada0a69fc9))
* **node:** increase buffer size for JWT in UI ([1040aa2](https://github.com/PrivateAIM/helm/commit/1040aa2113a7d705448d33d89bd921d8f6ac6c6a))
* only specify dnd insecure-registry if host is defined ([4fdf09e](https://github.com/PrivateAIM/helm/commit/4fdf09e8dc4cc57460753d63ba4f2c1f2392263d))
* postgres instances conflicting ([e56308b](https://github.com/PrivateAIM/helm/commit/e56308b6efb5c8f1d8efc023dfc48b23ca2969ff))
* reduced reconnection timeout for mayastor nvme driver to prevent long restarts ([62aa91b](https://github.com/PrivateAIM/helm/commit/62aa91b097c31d3feb7115031b3c2c9a642df309))
* remove dead comments in values (that were meant for harbor secrets but are not necessary) ([655c4a6](https://github.com/PrivateAIM/helm/commit/655c4a6a5a643195c3017d3ab4e95e3bf60ba84d))
* typos and add labels to po resources ([4d6ee9d](https://github.com/PrivateAIM/helm/commit/4d6ee9d55b2cabfcdf3cc4a4a39c73e8f4ab01b7))
* update hub authentication variables to use client ID and secret ([c7da749](https://github.com/PrivateAIM/helm/commit/c7da7499df4bf63cccb02ad128a2ea931d10e832))
* update HUB_LOGGING and STATUS_LOOP_INTERVAL values to ensure correct type handling ([f2d1737](https://github.com/PrivateAIM/helm/commit/f2d17374baae6bba978be9015415c98198fe6bfc))
* **values:** add robot user and secret fields for hub authentication ([4612449](https://github.com/PrivateAIM/helm/commit/4612449440d0e77de016661d22a6006b0901b6c6))
* **values:** update hub authentication to use client ID and secret ([989c326](https://github.com/PrivateAIM/helm/commit/989c3260db28cdd97ed0f460acb6ee8077f817b7))
* **values:** update image tag to new-hub for testing ([de18eb6](https://github.com/PrivateAIM/helm/commit/de18eb6aeadcc67a0a59447c15aa4e7fb322bd8e))


### Performance Improvements

* **node:** have hub adapter wait for keycloak init ([f35f109](https://github.com/PrivateAIM/helm/commit/f35f1094d8899b651d5b1cf29216edc0d21e8365))
* **node:** set internal KC to prod ([eb9df33](https://github.com/PrivateAIM/helm/commit/eb9df3341a51fa250dd2fd6cdc3de8ba37c5aa66))
* **node:** set wait-for-keycloak initcontainer to use kc health ep ([219ee42](https://github.com/PrivateAIM/helm/commit/219ee42e08052d674e4201868ad1b4114015fd64))


### Reverts

* **node:** revert node UI env vars ([0e282b4](https://github.com/PrivateAIM/helm/commit/0e282b4e0dd3fccb0fa36094299cf5dacfcb2b58))

## 0.0.11


### Refactoring

* **node**: rename node-result-service to node-storage-service ([14b6f91](https://github.com/PrivateAIM/helm/commit/14b6f91634798a0d29ba25a374718841d6460330))

## [0.0.10](https://github.com/PrivateAIM/helm/compare/root-0.0.9...root-0.0.10) (2025-11-21)


### Features

* **node:** add statusLoopInterval to podOrc values ([66fc9a1](https://github.com/PrivateAIM/helm/commit/66fc9a1d973f7bbb5a034cbd3b00e597a867d7ba))


### Bug Fixes

* **node:** add default empty string to robotSecret so b64enc works ([cd51b71](https://github.com/PrivateAIM/helm/commit/cd51b71f896156e424c25954df488b9d461b8af2))
* **node:** remove "offline" value and fix sign in when ingress disabled ([64feebd](https://github.com/PrivateAIM/helm/commit/64feebde5e613109d9d3f8900b68b9f738da32a5))


### Performance Improvements

* **node:** change podorc image pullPolicy to IfNotPresent ([f8203ed](https://github.com/PrivateAIM/helm/commit/f8203ed5b8760b3a841f8ed23924e364e7287f5c))


### Reverts

* **node:** add offline back to values ([04b4c1b](https://github.com/PrivateAIM/helm/commit/04b4c1bd05303008a8ee0f5ba58720e402c5b570))

## [0.0.9](https://github.com/PrivateAIM/helm/compare/root-v0.0.8...root-0.0.9) (2025-10-16)


### Bug Fixes

* annoying punkt ([fa44f34](https://github.com/PrivateAIM/helm/commit/fa44f343f119ee2790f815195013796c78bb6be6))
* annoying punkt ([e38c441](https://github.com/PrivateAIM/helm/commit/e38c441ddefc0390ea5eed35c67566028c299fcb))
* **node:** add postgres port value to keep PO happy ([5a7cb4d](https://github.com/PrivateAIM/helm/commit/5a7cb4dcfbd69affd8028ddef676a848d5290600))
* **node:** remove optional keycloak disable ([b18a139](https://github.com/PrivateAIM/helm/commit/b18a1395e82a31d5d5b0cd8a6fda29755fbe88ca))
* release-please configuration for authup ([fc27e19](https://github.com/PrivateAIM/helm/commit/fc27e191bd6d8c21c5caff0da84bb9f7a763411b))
* skip github release for charts ([c1fce07](https://github.com/PrivateAIM/helm/commit/c1fce0766c40ecb17d40c0835cdcb08363db7b87))
* update mongodb pvc size ([ad354a4](https://github.com/PrivateAIM/helm/commit/ad354a42c916d2da9b60c77f619fedb3c186fb2c))
* update mongodb pvc size ([cdf93bc](https://github.com/PrivateAIM/helm/commit/cdf93bc0fcfe9ee7e0153cc687f4cadc233f23f0))
* update release-please manifest file ([148df94](https://github.com/PrivateAIM/helm/commit/148df9471c92986524450c29604d9ccf8e854c11))

## [0.0.8](https://github.com/PrivateAIM/helm/compare/root-v0.0.7...root-v0.0.8) (2025-10-06)


### Features

* **certs:** add support for providing additional CA certs ([c5850ba](https://github.com/PrivateAIM/helm/commit/c5850ba212e53ba6a6f86a39555ea675b88aeeb2))
* harden chart dependency image versions ([9832584](https://github.com/PrivateAIM/helm/commit/98325849ca719c5724647601fb9b58e807369ffc))
* **headless:** add headless mode to HA and values ([a5b4250](https://github.com/PrivateAIM/helm/commit/a5b42502f4a9f36cb86986b9d282bdb282d3b189))
* **kong:** use self-managed postgres instance rather than sub-chart ([935d11c](https://github.com/PrivateAIM/helm/commit/935d11c2f1f49fc865f5841e616321de32f6cdcf))
* manage pull-policy via values.yaml configuration ([d5fe904](https://github.com/PrivateAIM/helm/commit/d5fe904ac84ed0d79fe7a9a50919c2d11542dd76))


### Bug Fixes

* **certs:** make certs configmap mount conditional ([17786ef](https://github.com/PrivateAIM/helm/commit/17786efa8fdb54726462fad09d6f6f4e49e309d0))
* **certs:** update MB envVar ([10ff742](https://github.com/PrivateAIM/helm/commit/10ff742f05a202e4ac85bc9c1752c02d7d0ca7cc))
* grafana-loki memcached image repository & tag ([f570494](https://github.com/PrivateAIM/helm/commit/f5704943464005d72a4a0e02c6047746a1ea3ae4))
* **ha:** set default idp endpoint to use k8s URI ([e35d57b](https://github.com/PrivateAIM/helm/commit/e35d57b74da7274f8cf3851fb6bc55c5d9d38405))
* **keycloak:** add clientRoles for service1 in kc configmap ([3c9eee0](https://github.com/PrivateAIM/helm/commit/3c9eee010bc20e065062572221f893257b585469))
* set alloy image repository & tag ([8f6bb0e](https://github.com/PrivateAIM/helm/commit/8f6bb0efb19c27376f05f3d954723386054b92a7))
* set memcachedchunks repository of grafana-loki ([9a7a124](https://github.com/PrivateAIM/helm/commit/9a7a1245d68f70ece6b9822709ed2bba93dcee10))
* **values:** update image tag and pull policy ([f7ef056](https://github.com/PrivateAIM/helm/commit/f7ef0560d9fd0559149660dd1fb7026a7f0de27f))

## [0.0.7](https://github.com/PrivateAIM/helm/compare/root-v0.0.6...root-v0.0.7) (2025-08-28)


### Features

* bump dependency versions ([5f55c6a](https://github.com/PrivateAIM/helm/commit/5f55c6a75726f27063b9019cb5aabaa8118e354b))
* initial harbor integration ([64fe8ec](https://github.com/PrivateAIM/helm/commit/64fe8ecbf0a512afc07c2a0e675f2196f13353f9))
* integrated telemetry service ([0290265](https://github.com/PrivateAIM/helm/commit/0290265b3a15dbaa5fd8ede3fd52804ca905a803))
* **mb:** add new env vars for proxy ([927bb8d](https://github.com/PrivateAIM/helm/commit/927bb8d44b742f56450dff6a835a92db24c89a84))
* merge hub charts ([#50](https://github.com/PrivateAIM/helm/issues/50)) ([3f82eac](https://github.com/PrivateAIM/helm/commit/3f82eacd2b385ff47ca2332c157c3312a288c691))
* pass loki distributor url to telemetry service ([0c2f03e](https://github.com/PrivateAIM/helm/commit/0c2f03e3cdd57b3be496896b31e859b1c687ed39))
* pass rabbitmq connection string to storage & messenger service ([9435dfd](https://github.com/PrivateAIM/helm/commit/9435dfd601ca79e8b79c43d9894fb1100762bc0b))
* **ui:** add no proxy option to UI and values.yaml ([48ed48f](https://github.com/PrivateAIM/helm/commit/48ed48f4208ca0364dc53fe4a4cf17032ed2153c))


### Bug Fixes

* extend default values file ([2d7ee59](https://github.com/PrivateAIM/helm/commit/2d7ee59661bb024d68bbac75996c831dfd33c6fb))
* image arg for core-worker & prometheus static config ([592b6d2](https://github.com/PrivateAIM/helm/commit/592b6d2e712749e1c41b3f11cf9dd2ec373c6ab3))
* initContainers and urls for server-telemetry deployment ([0e86809](https://github.com/PrivateAIM/helm/commit/0e868095112d4e2d057f7e1dd665d7d33dadb623))
* **mb:** remove proxy env vars if no proxy is set ([54dbc26](https://github.com/PrivateAIM/helm/commit/54dbc26a0a9733373a7699f757b687ceeac20184))
* serving grafana ui ([2dc5582](https://github.com/PrivateAIM/helm/commit/2dc558281d575920c47e0bde6f559ea94435848f))
* **svc:** use long form service names for backend calls ([c93566f](https://github.com/PrivateAIM/helm/commit/c93566fa4d3d30584908ee861da2dda19e6d8981))

## [0.0.6](https://github.com/PrivateAIM/helm/compare/root-v0.0.5...root-v0.0.6) (2025-08-04)


### Features

* **adapter:** add offline param to hub adapter values ([81b710a](https://github.com/PrivateAIM/helm/commit/81b710a6039332e92e0c37643a572f38a6f6a2c1))
* add monitoring capabilities to hub deployment ([#38](https://github.com/PrivateAIM/helm/issues/38)) ([ceda045](https://github.com/PrivateAIM/helm/commit/ceda045fc7ba05d18dcf29762425703481a14c2d))
* add unique flame-component label ([11085c7](https://github.com/PrivateAIM/helm/commit/11085c72627cc3eaf706ae6c367ae6d898a4b72b))
* additional offline env vars for UI and HA ([e136410](https://github.com/PrivateAIM/helm/commit/e136410caaef4367115a71ec2808fbebbf2f184a))
* **blaze:** migrate deployment to statefulset and update values for persistence ([4dd3a5e](https://github.com/PrivateAIM/helm/commit/4dd3a5ec31d3a2345a062ca3ad6c4a37f30d0603))
* **broker:** working forward proxy ([295e887](https://github.com/PrivateAIM/helm/commit/295e88705f93519e1e40b2c06c9216c3fb1a1e11))
* **ha:** update env vars to allow for other internal IDPs ([fc9e067](https://github.com/PrivateAIM/helm/commit/fc9e067a5e3558e46810ec9716cef8577b212572))
* **idp:** add support for separate user IDP and update global values ([21f8655](https://github.com/PrivateAIM/helm/commit/21f865558e53c6e8e9857ecf17e2936d7b1bab7e))
* integrate message broker into flame-node chart ([34a955e](https://github.com/PrivateAIM/helm/commit/34a955e9d896c09a7df3b30ef4d402523f60be8c))
* integrate message broker into flame-node chart and begin consolidating helper functions ([794f5af](https://github.com/PrivateAIM/helm/commit/794f5aff915cc0f61901b2ce4a8dc8ceb52af1c3))
* integrate podOrc into flame-node chart and move postgresql to parent chart ([71dc262](https://github.com/PrivateAIM/helm/commit/71dc26276acf4f9a8b91ee9fa87f9a920c09589f))
* integrate result service into flame-node chart and move minio to parent chart ([de840a0](https://github.com/PrivateAIM/helm/commit/de840a0195eaa53d5050c61fd83f4c4596561e0f))
* integrate UI and hub adapter into flame-node chart ([e7d7360](https://github.com/PrivateAIM/helm/commit/e7d73604d6444fb03dbd6ac90c6affeebcbb637b))
* **keycloak:** enable microsvcs to user controller agnostic idp subpath ([bccf995](https://github.com/PrivateAIM/helm/commit/bccf9950858b1d4eaa6ef5a11dbb8f0aaba63da4))
* pass loki component urls to container ([c51670f](https://github.com/PrivateAIM/helm/commit/c51670fa6e0a9fa649721f153ae9cfa35a7a773a))
* **proxy:** update hub-adapter to use forward proxy values ([2217215](https://github.com/PrivateAIM/helm/commit/22172154da4900fc8ecf91b76573fc512a945ed6))
* **proxy:** update result service to use forward proxy values ([310a7fa](https://github.com/PrivateAIM/helm/commit/310a7fa027964f2190a19c97ef49cf9590256045))
* **proxy:** working message broker proxy options ([a4109b0](https://github.com/PrivateAIM/helm/commit/a4109b0462a1705f41cb3cbefdc845195a17d7e9))
* **results:** crypto private key passed as existing secret or value ([611babf](https://github.com/PrivateAIM/helm/commit/611babf54fcc70b5d39e6e2a87d47073eb4290f1))
* **ui:** add proxy configuration to UI deploy ([5020b48](https://github.com/PrivateAIM/helm/commit/5020b48ef80660f9aee51e24ba0b8b42d3ce128a))


### Bug Fixes

* add labels to services ([f59b226](https://github.com/PrivateAIM/helm/commit/f59b22660986fa941181e20a1e2f60c084608033))
* add missing matchLabels ([c2c374b](https://github.com/PrivateAIM/helm/commit/c2c374b18c36308d411e2f64c4f7726a396db3d1))
* default image tags and pin image versions in values.yaml ([f42b09d](https://github.com/PrivateAIM/helm/commit/f42b09d163f906f71c90f4a6bb2728b9f24baedf))
* helper functions and revert message broker image ([e4aa990](https://github.com/PrivateAIM/helm/commit/e4aa99077306f7edff9a91d37487671a5ae91b7c))
* **po:** update component labels ([4116e50](https://github.com/PrivateAIM/helm/commit/4116e503065051b6403d83b6ad72c93d39f2ccbd))
* **proxy:** add missing proxy env vars and update value comments ([a3b3083](https://github.com/PrivateAIM/helm/commit/a3b30833604d7622e0b49b4b01e2969626152cd0))
* **result:** update result deployment to use new env vars ([b0324cf](https://github.com/PrivateAIM/helm/commit/b0324cf1839d0201f6760440a37554447e0d0ba8))


### Reverts

* move datastore chart to top level again for merge ([02743f8](https://github.com/PrivateAIM/helm/commit/02743f8ec5e48eaa09cb61643f70481f171bb4d3))
* **results:** set result-service to previous sha ([a81ff6d](https://github.com/PrivateAIM/helm/commit/a81ff6d314903a4ca50bba3e733f48ce8e32d5d7))

## [0.0.5](https://github.com/PrivateAIM/helm/compare/root-v0.0.4...root-v0.0.5) (2025-05-07)


### Features

* add conventional Helm values as in 'helm create' ([19c7d1f](https://github.com/PrivateAIM/helm/commit/19c7d1f082330596233fa619151fddc247b3e3b1))
* add cookie domain env to third-party authup ([83dc3cd](https://github.com/PrivateAIM/helm/commit/83dc3cd840c569c53ac9ab3f9f7ac2ea4b6eff99))
* add ingress config to hub client-ui ([1fa1671](https://github.com/PrivateAIM/helm/commit/1fa1671b2c6af3c40e605050fd075e9004db4abb))
* allow specifying default master images branch ([6bdafbd](https://github.com/PrivateAIM/helm/commit/6bdafbda9203835a374bb951ffcf53f61bdf3dbb))
* flatten chart structure ([4ab8116](https://github.com/PrivateAIM/helm/commit/4ab811668a8f81e62796d14820fcf55f6380772b))
* introduce appGroup metadata label for hub services ([238a7ef](https://github.com/PrivateAIM/helm/commit/238a7efdc8246f1e44150895347da51ce4a7b18a))
* support cookie domain for hub client-ui ([18b17cb](https://github.com/PrivateAIM/helm/commit/18b17cbae14f6f5520a9b659f65ff475be7a69c7))
* support opting out of bundled Keycloak deployment ([a971486](https://github.com/PrivateAIM/helm/commit/a97148624f193cb33faafdf9b50ce4c83e808f41))
* support public url for authup service ([9462906](https://github.com/PrivateAIM/helm/commit/94629067c81e72146b41f50146f51853a0ebe358))
* updated external dependencies, ssl support & liveness probe adjustments ([28203dc](https://github.com/PrivateAIM/helm/commit/28203dc3da2327f66f3024ac320d5d91eaceedfc))
* use app chart version in hub deployments ([#9](https://github.com/PrivateAIM/helm/issues/9)) ([14d6757](https://github.com/PrivateAIM/helm/commit/14d67578c6b29ddd93c34123d200e49cd2b50d29))


### Bug Fixes

* add checksum for secrets in PO deployment ([03332ca](https://github.com/PrivateAIM/helm/commit/03332ca12fcae823cb09ab79bfcf8424afe31106))
* add checksum to PO deploy to check for updated secrets during a helm upgrade ([4edfdc6](https://github.com/PrivateAIM/helm/commit/4edfdc68f60288f9bbb7934f55e6115fbd972b36))
* add checksum to trigger pod recreation if secret changes ([7aa524f](https://github.com/PrivateAIM/helm/commit/7aa524f9b36c4e65e4efc285c8f908177c2ad195))
* add checksum to trigger pod recreation if secret changes ([a37d2b8](https://github.com/PrivateAIM/helm/commit/a37d2b8c411abd1d90379f67bd9926f088f40f90))
* add missing ingress path / for authup ([0f61334](https://github.com/PrivateAIM/helm/commit/0f61334f1faa7a3b01f4550d6cfe9cbc4657ed28))
* add missing port number in storage deployment ([fc71e64](https://github.com/PrivateAIM/helm/commit/fc71e642b0dbe6ad9195d53148a0096b07380048))
* add security context to analysis-manager ([922da92](https://github.com/PrivateAIM/helm/commit/922da92673a014ede9d5dd9136c423b673edbe2f))
* buggy pod orchestration rbac ([#8](https://github.com/PrivateAIM/helm/issues/8)) ([9e7831d](https://github.com/PrivateAIM/helm/commit/9e7831d0f37b5d7d7358a5d234a7dcb54539636b))
* convert metadata annotation value to string ([ac77dea](https://github.com/PrivateAIM/helm/commit/ac77dea5f97ab390fe0eab0b44c391f4355ab9ec))
* extended root README.md ([e3f6df8](https://github.com/PrivateAIM/helm/commit/e3f6df8703116adef0d555f5b657c42ac585c0f8))
* helm values.yaml file ([82fbfb7](https://github.com/PrivateAIM/helm/commit/82fbfb7aa56debe36a593d7dd29bd8be2c823845))
* nginx max body size for storage service ([34df94b](https://github.com/PrivateAIM/helm/commit/34df94ba3999ecb6b81eee7f29b353a811f957d6))
* quotes in cookie domain variable assignment ([a93a6ed](https://github.com/PrivateAIM/helm/commit/a93a6eda76daade4e09453bde2190f33b1627929))
* remove single indent ([d5eb50a](https://github.com/PrivateAIM/helm/commit/d5eb50a267cdcf973aee899a8d12cbd691933e46))
* set default path to / ([0842b0e](https://github.com/PrivateAIM/helm/commit/0842b0e483fcdd6b186ec0472d51d1e44e6cdd03))
* set docker sock to socket type ([184880b](https://github.com/PrivateAIM/helm/commit/184880befec4dbdf7c0d5ad575c745889e4f9fc2))
* set volume hostPath type to File ([95e710c](https://github.com/PrivateAIM/helm/commit/95e710c32b73b2b9a8b40634c802a606ce4e1639))

## [0.0.4](https://github.com/PrivateAIM/helm/compare/root-v0.0.3...root-v0.0.4) (2025-03-25)


### Features

* add node helm charts ([764756c](https://github.com/PrivateAIM/helm/commit/764756cfc248b8ed421c99d2e122795caff1dc9e))

## [0.0.3](https://github.com/PrivateAIM/helm/compare/root-v0.0.2...root-v0.0.3) (2025-03-25)


### Features

* checkout git & set default git details ([20d16e2](https://github.com/PrivateAIM/helm/commit/20d16e26ca489344841b4afd9abbeb47f0655ad5))

## [0.0.2](https://github.com/PrivateAIM/helm/compare/root-v0.0.1...root-v0.0.2) (2025-03-25)


### Features

* add charts directory from hub repositoryÂ ([6d55170](https://github.com/PrivateAIM/helm/commit/6d551708b627abe3d8f0ceef91ffc8fe394f908e))
* add release please configuration ([aa6af2b](https://github.com/PrivateAIM/helm/commit/aa6af2ba3ae0fe0f5b360271219a646a26e642f0))
* add release-please configuration ([b348fe1](https://github.com/PrivateAIM/helm/commit/b348fe177ca845c942b7e439ab60d0708b66b110))
* init project from source ([91d5b21](https://github.com/PrivateAIM/helm/commit/91d5b2140f30330f131173d7986a6315a310d8e8))
* integrate hevi action ([5836dbd](https://github.com/PrivateAIM/helm/commit/5836dbd43eb963cc2835069c0bd21d2a884a9844))
* prefix helm charts ([03f24a1](https://github.com/PrivateAIM/helm/commit/03f24a1f67e2c58d423cd754b0684e934a0ac9b7))
* remove flame-hub-shared chart ([7cec5a3](https://github.com/PrivateAIM/helm/commit/7cec5a3318e0c015beac1557073b8aff747e7db3))
* shared configuration ([623600a](https://github.com/PrivateAIM/helm/commit/623600aac22a27e5c893fef35f0959fa0cd16091))
* suggest helm repository index in README.md ([8d4831f](https://github.com/PrivateAIM/helm/commit/8d4831f97963a4edab8c33b6881f71512f44362b))


### Bug Fixes

* remove charts directory ([3c6ba4d](https://github.com/PrivateAIM/helm/commit/3c6ba4d1c5e6a99e4b38260c6de74a9e197e1519))
* remove flame-hub-shared from dependency list ([e69bc50](https://github.com/PrivateAIM/helm/commit/e69bc50de4dadf87afb46e9bfec953a03639a39f))
* rename release please config file ([d7f68c1](https://github.com/PrivateAIM/helm/commit/d7f68c153380a41c63ef6bbc7dac022f324b9354))
* update .gitignore file ([a0c9d8f](https://github.com/PrivateAIM/helm/commit/a0c9d8f266b6ba707066e06c2f99b168cd8b7eaa))
