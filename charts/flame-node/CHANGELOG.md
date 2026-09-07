# Changelog

## [1.0.0](https://github.com/PrivateAIM/helm/compare/flame-node-0.2.1...flame-node-1.0.0) (2026-09-03)


### Features

* mege develop in master ([8bf6d63](https://github.com/PrivateAIM/helm/commit/8bf6d634933407d76bb3d8f68c8223f248510735))
* mege develop in master ([8bf6d63](https://github.com/PrivateAIM/helm/commit/8bf6d634933407d76bb3d8f68c8223f248510735))


### Bug Fixes

* **security:** add missing non root security contexts to node components ([d59b5af](https://github.com/PrivateAIM/helm/commit/d59b5afa6e6cd60d74a91e90e055d63e68f689f7))
* **security:** add missing security contexts and seccompProfiles to node components ([45ed80d](https://github.com/PrivateAIM/helm/commit/45ed80d1cc8a6f2d99b4b6a6140e71f99c441516))


### Reverts

* **seaweedfs:** remove security context for filer since no create bucket ([45e7998](https://github.com/PrivateAIM/helm/commit/45e799867eb824a8b3642b3c4e9d4bd273a80a94))

## [0.2.1](https://github.com/PrivateAIM/helm/compare/flame-node-0.2.0...flame-node-0.2.1) (2026-08-19)


### Miscellaneous Chores

* **flame-node:** Synchronize global versions

## [0.2.0](https://github.com/PrivateAIM/helm/compare/flame-node-0.1.0...flame-node-0.2.0) (2026-08-11)


### ⚠ BREAKING CHANGES

* **flame-node:** working node seaweedfs and updated values_min
* **flame-node:** working node seaweedfs and updated values_min
* harden flame-node chart security
* allow passing proxy info as secret in flame-node

### Features

* add HUB_LOGGING environment variable ([95d8309](https://github.com/PrivateAIM/helm/commit/95d8309bfc0910fa305576f0e6f750f0310fc49c))
* allow passing proxy info as secret in flame-node ([cb9629a](https://github.com/PrivateAIM/helm/commit/cb9629a5010a841b3331dee6cfc9bf32a9b91398))
* external gateway option ([#129](https://github.com/PrivateAIM/helm/issues/129)) ([c6ae564](https://github.com/PrivateAIM/helm/commit/c6ae5647fc3942238e22ab47771d628a18eb972b))
* **flame-node:** v1 of seaweedfs ([1feaa67](https://github.com/PrivateAIM/helm/commit/1feaa671c144d54489005723e6bb4d765b7cf711))
* **flame-node:** v1 of seaweedfs ([ded1f20](https://github.com/PrivateAIM/helm/commit/ded1f20338c0e709c896fa140c53e4bf485e860e))
* **flame-node:** working node seaweedfs and updated values_min ([3fb3cad](https://github.com/PrivateAIM/helm/commit/3fb3cad6658f6b32ab5e2d77cbd01e3e4870ea31))
* **flame-node:** working node seaweedfs and updated values_min ([386d5c8](https://github.com/PrivateAIM/helm/commit/386d5c87d123452a7a89b6ec1d41f66158f9ab8c))
* harden flame-node chart security ([e4fa99f](https://github.com/PrivateAIM/helm/commit/e4fa99fa6c0db36afc5016602874d4d6c3a825f4))
* integrate Harbor ([#86](https://github.com/PrivateAIM/helm/issues/86)) ([dd1ac29](https://github.com/PrivateAIM/helm/commit/dd1ac2939e91dd0e80209a9fd854b97c1c6978d8))
* **kong:** add custom minio-gateway plugin configuration ([206fd2f](https://github.com/PrivateAIM/helm/commit/206fd2f798389276f16bca6c2b1aa3af1af64bb2))
* **mb:** add node message broker service port for health checks ([30db93a](https://github.com/PrivateAIM/helm/commit/30db93abec10bf90542f01620b14a845c947e0d2))
* **node:** add conditional httproute for seaweedfs ([e6adcd9](https://github.com/PrivateAIM/helm/commit/e6adcd966623b287770374984e971f9a00e968be))
* **node:** add conditional httproute for seaweedfs ([e165f97](https://github.com/PrivateAIM/helm/commit/e165f978669d1c023353ecf3f41b28005e1c4680))
* **node:** add default roles to keycloak and update HA ([ce24387](https://github.com/PrivateAIM/helm/commit/ce243879ec87dd293e1dbc951e9d0dab48e2c357))
* **node:** add env vars for PO deploy for net stats ([793e119](https://github.com/PrivateAIM/helm/commit/793e11998cd4b1787d9ff031421c2abf2b1cc7df))
* **node:** add gateway api support to victorialogs ([7548a2e](https://github.com/PrivateAIM/helm/commit/7548a2e3a4b2bdfabc1e26852615b82fc9842bee))
* **node:** add keycloak secret sync job with rbac ([38778fa](https://github.com/PrivateAIM/helm/commit/38778fa768a120721c22c641e2f3cc0dd46c1ac5))
* **node:** add postgres env vars to hub adapter deployment ([cdadf58](https://github.com/PrivateAIM/helm/commit/cdadf586fc69809e9dee60db21e5b3e0f3e95327))
* **node:** add statusLoopInterval to podOrc values ([66fc9a1](https://github.com/PrivateAIM/helm/commit/66fc9a1d973f7bbb5a034cbd3b00e597a867d7ba))
* **node:** add victoria logs to Chart.yaml and values.yaml ([0d18328](https://github.com/PrivateAIM/helm/commit/0d1832810d971ec98e85e86ffaf2ec6e425e38c8))
* **node:** allow user to set custom nuxt auth secret for node ui ([22a4b9c](https://github.com/PrivateAIM/helm/commit/22a4b9c8a4bf492ec41375ee8fb551d3daa01bef))
* **node:** log level parsing in victorialogs ([1473dd7](https://github.com/PrivateAIM/helm/commit/1473dd719de2d92b517d2f525ff145e08aa8b48c))
* **node:** make nuxt auth secret persist between upgrades ([23d550d](https://github.com/PrivateAIM/helm/commit/23d550d651d87048188dbad762cb1dbdc8b859a4))
* **node:** working gateway templates ([2c36c34](https://github.com/PrivateAIM/helm/commit/2c36c34798aaf14708457357cbff749ab2329b9a))


### Bug Fixes

* annoying punkt ([fa44f34](https://github.com/PrivateAIM/helm/commit/fa44f343f119ee2790f815195013796c78bb6be6))
* annoying punkt ([e38c441](https://github.com/PrivateAIM/helm/commit/e38c441ddefc0390ea5eed35c67566028c299fcb))
* correct typo in enableHubLogging description for clarity ([4f931d3](https://github.com/PrivateAIM/helm/commit/4f931d398783443db4011a680d6f0046d5e19fb2))
* **flame-node:** allow keycloak to start when expose type is none ([e5af584](https://github.com/PrivateAIM/helm/commit/e5af5840959aaa64ea8c147891dcccd2af89535f))
* **flame-node:** disable seaweedfs CR ([1de5f2f](https://github.com/PrivateAIM/helm/commit/1de5f2fcfd256b99fd0e3c86b47ba39a87c014c2))
* **flame-node:** disable seaweedfs CR ([720a7c7](https://github.com/PrivateAIM/helm/commit/720a7c73b486bf8458665cd645be9f1bb15a6cdc))
* **flame-node:** enable manually setting KC service secrets ([ea79496](https://github.com/PrivateAIM/helm/commit/ea7949607bf9b986c31e7a465c1637488ddc9088))
* **flame-node:** harden security contexts with numerical non-root users for third party images ([72456d7](https://github.com/PrivateAIM/helm/commit/72456d7872c2b081c506b360f50802bcce9ad50f))
* **flame-node:** helper functions apply https when tls provided ([fedb6c5](https://github.com/PrivateAIM/helm/commit/fedb6c55f80bcd89a0e69a5040888fbd1f8fcf17))
* **flame-node:** move secret separators within if blocks ([d0b4f24](https://github.com/PrivateAIM/helm/commit/d0b4f2408b205eb606d5bfd5180c0d6ec15c3634))
* **flame-node:** set seaweed admin credentials in values ([9505cae](https://github.com/PrivateAIM/helm/commit/9505cae37ba039752b851e69faa27cb5c5bb458c))
* **flame-node:** set seaweed admin credentials in values ([e7df924](https://github.com/PrivateAIM/helm/commit/e7df9242315927f8247f8a16aee98411ad85e34d))
* **node:** add default empty string to robotSecret so b64enc works ([cd51b71](https://github.com/PrivateAIM/helm/commit/cd51b71f896156e424c25954df488b9d461b8af2))
* **node:** add hostname for local keycloak ([371aeca](https://github.com/PrivateAIM/helm/commit/371aecae3d22a4616d17c065d6fd2eada0a69fc9))
* **node:** add support for gateway TLS termination ([11105ed](https://github.com/PrivateAIM/helm/commit/11105ed23c0719ae6ae79c89fbd7e45762f3a106))
* **node:** avoid conflicting seaweed SAs ([c774be8](https://github.com/PrivateAIM/helm/commit/c774be800390d4e2a01a9f1ed4103c9c4121ca6c))
* **node:** avoid conflicting seaweed SAs ([98d14d4](https://github.com/PrivateAIM/helm/commit/98d14d4983d6a5c086b53d7f29dcd574513f1b6a))
* **node:** improve hostname parsing in edge cases ([6240a92](https://github.com/PrivateAIM/helm/commit/6240a925bee9a46a94436df95ef4fd702e339041))
* **node:** increase buffer size for JWT in UI ([1040aa2](https://github.com/PrivateAIM/helm/commit/1040aa2113a7d705448d33d89bd921d8f6ac6c6a))
* **node:** make use of keycloak http relativePath in URL generation ([8ba9abd](https://github.com/PrivateAIM/helm/commit/8ba9abd15a488562716800c6c617a7b5b3c53111))
* **node:** modify kc settings for upstream TLS termination ([22d77f8](https://github.com/PrivateAIM/helm/commit/22d77f898b44a14d8fa7a8eae54514e194df4696))
* **node:** remove "offline" value and fix sign in when ingress disabled ([64feebd](https://github.com/PrivateAIM/helm/commit/64feebde5e613109d9d3f8900b68b9f738da32a5))
* **node:** update victorialogs alias names ([8beca80](https://github.com/PrivateAIM/helm/commit/8beca80956670af3d0d2fc9313d1ff321eb7d9b8))
* **node:** use standard value naming schema ([f745ba8](https://github.com/PrivateAIM/helm/commit/f745ba8e154ca22c04037ee664fcbb916a121942))
* typos and add labels to po resources ([4d6ee9d](https://github.com/PrivateAIM/helm/commit/4d6ee9d55b2cabfcdf3cc4a4a39c73e8f4ab01b7))
* update hub authentication variables to use client ID and secret ([c7da749](https://github.com/PrivateAIM/helm/commit/c7da7499df4bf63cccb02ad128a2ea931d10e832))
* update HUB_LOGGING and STATUS_LOOP_INTERVAL values to ensure correct type handling ([f2d1737](https://github.com/PrivateAIM/helm/commit/f2d17374baae6bba978be9015415c98198fe6bfc))
* update mongodb pvc size ([ad354a4](https://github.com/PrivateAIM/helm/commit/ad354a42c916d2da9b60c77f619fedb3c186fb2c))
* update mongodb pvc size ([cdf93bc](https://github.com/PrivateAIM/helm/commit/cdf93bc0fcfe9ee7e0153cc687f4cadc233f23f0))
* **values:** add robot user and secret fields for hub authentication ([4612449](https://github.com/PrivateAIM/helm/commit/4612449440d0e77de016661d22a6006b0901b6c6))
* **values:** update hub authentication to use client ID and secret ([989c326](https://github.com/PrivateAIM/helm/commit/989c3260db28cdd97ed0f460acb6ee8077f817b7))
* **values:** update image tag to new-hub for testing ([de18eb6](https://github.com/PrivateAIM/helm/commit/de18eb6aeadcc67a0a59447c15aa4e7fb322bd8e))


### Performance Improvements

* **flame-node:** simplify seaweed inetgration ([717652c](https://github.com/PrivateAIM/helm/commit/717652c016f53e050b5d7ae5ae17ee87b9ec099b))
* **flame-node:** simplify seaweed inetgration ([ede43da](https://github.com/PrivateAIM/helm/commit/ede43dadeba8b8abe232d88f3919af72040a15b9))
* **node:** change podorc image pullPolicy to IfNotPresent ([f8203ed](https://github.com/PrivateAIM/helm/commit/f8203ed5b8760b3a841f8ed23924e364e7287f5c))
* **node:** have hub adapter wait for keycloak init ([f35f109](https://github.com/PrivateAIM/helm/commit/f35f1094d8899b651d5b1cf29216edc0d21e8365))
* **node:** optimize ui and HA probes ([c8ef560](https://github.com/PrivateAIM/helm/commit/c8ef5600db1775a2cab6e450ae998a8bdff7845e))
* **node:** remove mogodb logs from victorialogs ([2916202](https://github.com/PrivateAIM/helm/commit/29162021fdb31b6687a1fa69861ca517555587bc))
* **node:** set internal KC to prod ([eb9df33](https://github.com/PrivateAIM/helm/commit/eb9df3341a51fa250dd2fd6cdc3de8ba37c5aa66))
* **node:** set wait-for-keycloak initcontainer to use kc health ep ([219ee42](https://github.com/PrivateAIM/helm/commit/219ee42e08052d674e4201868ad1b4114015fd64))


### Reverts

* **mb:** add proxy whitelist back ([12937cd](https://github.com/PrivateAIM/helm/commit/12937cd5ce607a4754168f7437a6c12d43bc9e6d))
* **node:** add offline back to values ([04b4c1b](https://github.com/PrivateAIM/helm/commit/04b4c1bd05303008a8ee0f5ba58720e402c5b570))
* **node:** revert helpers ([fa8a5ee](https://github.com/PrivateAIM/helm/commit/fa8a5ee08868201feaa2532295d1d75bd3f82139))
* **node:** revert node UI env vars ([0e282b4](https://github.com/PrivateAIM/helm/commit/0e282b4e0dd3fccb0fa36094299cf5dacfcb2b58))

## [0.1.0](https://github.com/PrivateAIM/helm/compare/flame-node-0.0.11...flame-node-0.1.0) (2026-06-01)


### ⚠ BREAKING CHANGES

* harden flame-node chart security
* allow passing proxy info as secret in flame-node

### Features

* allow passing proxy info as secret in flame-node ([cb9629a](https://github.com/PrivateAIM/helm/commit/cb9629a5010a841b3331dee6cfc9bf32a9b91398))
* external gateway option ([#129](https://github.com/PrivateAIM/helm/issues/129)) ([c6ae564](https://github.com/PrivateAIM/helm/commit/c6ae5647fc3942238e22ab47771d628a18eb972b))
* harden flame-node chart security ([e4fa99f](https://github.com/PrivateAIM/helm/commit/e4fa99fa6c0db36afc5016602874d4d6c3a825f4))
* **node:** add env vars for PO deploy for net stats ([793e119](https://github.com/PrivateAIM/helm/commit/793e11998cd4b1787d9ff031421c2abf2b1cc7df))
* **node:** add gateway api support to victorialogs ([7548a2e](https://github.com/PrivateAIM/helm/commit/7548a2e3a4b2bdfabc1e26852615b82fc9842bee))
* **node:** add keycloak secret sync job with rbac ([38778fa](https://github.com/PrivateAIM/helm/commit/38778fa768a120721c22c641e2f3cc0dd46c1ac5))
* **node:** add victoria logs to Chart.yaml and values.yaml ([0d18328](https://github.com/PrivateAIM/helm/commit/0d1832810d971ec98e85e86ffaf2ec6e425e38c8))
* **node:** allow user to set custom nuxt auth secret for node ui ([22a4b9c](https://github.com/PrivateAIM/helm/commit/22a4b9c8a4bf492ec41375ee8fb551d3daa01bef))
* **node:** log level parsing in victorialogs ([1473dd7](https://github.com/PrivateAIM/helm/commit/1473dd719de2d92b517d2f525ff145e08aa8b48c))


### Bug Fixes

* **node:** add support for gateway TLS termination ([11105ed](https://github.com/PrivateAIM/helm/commit/11105ed23c0719ae6ae79c89fbd7e45762f3a106))
* **node:** improve hostname parsing in edge cases ([6240a92](https://github.com/PrivateAIM/helm/commit/6240a925bee9a46a94436df95ef4fd702e339041))
* **node:** make use of keycloak http relativePath in URL generation ([8ba9abd](https://github.com/PrivateAIM/helm/commit/8ba9abd15a488562716800c6c617a7b5b3c53111))
* **node:** modify kc settings for upstream TLS termination ([22d77f8](https://github.com/PrivateAIM/helm/commit/22d77f898b44a14d8fa7a8eae54514e194df4696))
* **node:** update victorialogs alias names ([8beca80](https://github.com/PrivateAIM/helm/commit/8beca80956670af3d0d2fc9313d1ff321eb7d9b8))


### Performance Improvements

* **node:** optimize ui and HA probes ([c8ef560](https://github.com/PrivateAIM/helm/commit/c8ef5600db1775a2cab6e450ae998a8bdff7845e))
* **node:** remove mogodb logs from victorialogs ([2916202](https://github.com/PrivateAIM/helm/commit/29162021fdb31b6687a1fa69861ca517555587bc))


### Reverts

* **mb:** add proxy whitelist back ([12937cd](https://github.com/PrivateAIM/helm/commit/12937cd5ce607a4754168f7437a6c12d43bc9e6d))
* **node:** revert helpers ([fa8a5ee](https://github.com/PrivateAIM/helm/commit/fa8a5ee08868201feaa2532295d1d75bd3f82139))

## [0.0.11](https://github.com/PrivateAIM/helm/compare/flame-node-0.0.10...flame-node-0.0.11) (2026-03-25)


### Features

* add HUB_LOGGING environment variable ([95d8309](https://github.com/PrivateAIM/helm/commit/95d8309bfc0910fa305576f0e6f750f0310fc49c))
* integrate Harbor ([#86](https://github.com/PrivateAIM/helm/issues/86)) ([dd1ac29](https://github.com/PrivateAIM/helm/commit/dd1ac2939e91dd0e80209a9fd854b97c1c6978d8))
* **kong:** add custom minio-gateway plugin configuration ([206fd2f](https://github.com/PrivateAIM/helm/commit/206fd2f798389276f16bca6c2b1aa3af1af64bb2))
* **node:** add default roles to keycloak and update HA ([ce24387](https://github.com/PrivateAIM/helm/commit/ce243879ec87dd293e1dbc951e9d0dab48e2c357))
* **node:** add postgres env vars to hub adapter deployment ([cdadf58](https://github.com/PrivateAIM/helm/commit/cdadf586fc69809e9dee60db21e5b3e0f3e95327))


### Bug Fixes

* correct typo in enableHubLogging description for clarity ([4f931d3](https://github.com/PrivateAIM/helm/commit/4f931d398783443db4011a680d6f0046d5e19fb2))
* **node:** add hostname for local keycloak ([371aeca](https://github.com/PrivateAIM/helm/commit/371aecae3d22a4616d17c065d6fd2eada0a69fc9))
* **node:** increase buffer size for JWT in UI ([1040aa2](https://github.com/PrivateAIM/helm/commit/1040aa2113a7d705448d33d89bd921d8f6ac6c6a))
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

## [0.0.10](https://github.com/PrivateAIM/helm/compare/flame-node-0.0.9...flame-node-0.0.10) (2025-11-21)


### Features

* **node:** add statusLoopInterval to podOrc values ([66fc9a1](https://github.com/PrivateAIM/helm/commit/66fc9a1d973f7bbb5a034cbd3b00e597a867d7ba))


### Bug Fixes

* **node:** add default empty string to robotSecret so b64enc works ([cd51b71](https://github.com/PrivateAIM/helm/commit/cd51b71f896156e424c25954df488b9d461b8af2))
* **node:** remove "offline" value and fix sign in when ingress disabled ([64feebd](https://github.com/PrivateAIM/helm/commit/64feebde5e613109d9d3f8900b68b9f738da32a5))


### Performance Improvements

* **node:** change podorc image pullPolicy to IfNotPresent ([f8203ed](https://github.com/PrivateAIM/helm/commit/f8203ed5b8760b3a841f8ed23924e364e7287f5c))


### Reverts

* **node:** add offline back to values ([04b4c1b](https://github.com/PrivateAIM/helm/commit/04b4c1bd05303008a8ee0f5ba58720e402c5b570))

## [0.0.9](https://github.com/PrivateAIM/helm/compare/flame-node-0.0.8...flame-node-0.0.9) (2025-10-16)


### Bug Fixes

* annoying punkt ([fa44f34](https://github.com/PrivateAIM/helm/commit/fa44f343f119ee2790f815195013796c78bb6be6))
* annoying punkt ([e38c441](https://github.com/PrivateAIM/helm/commit/e38c441ddefc0390ea5eed35c67566028c299fcb))
* **node:** add postgres port value to keep PO happy ([5a7cb4d](https://github.com/PrivateAIM/helm/commit/5a7cb4dcfbd69affd8028ddef676a848d5290600))
* **node:** remove optional keycloak disable ([b18a139](https://github.com/PrivateAIM/helm/commit/b18a1395e82a31d5d5b0cd8a6fda29755fbe88ca))
* update mongodb pvc size ([ad354a4](https://github.com/PrivateAIM/helm/commit/ad354a42c916d2da9b60c77f619fedb3c186fb2c))
* update mongodb pvc size ([cdf93bc](https://github.com/PrivateAIM/helm/commit/cdf93bc0fcfe9ee7e0153cc687f4cadc233f23f0))

## [0.2.1](https://github.com/PrivateAIM/helm/compare/flame-node-v0.2.0...flame-node-v0.2.1) (2025-10-15)


### Features

* **adapter:** add offline param to hub adapter values ([81b710a](https://github.com/PrivateAIM/helm/commit/81b710a6039332e92e0c37643a572f38a6f6a2c1))
* add conventional Helm values as in 'helm create' ([19c7d1f](https://github.com/PrivateAIM/helm/commit/19c7d1f082330596233fa619151fddc247b3e3b1))
* add node helm charts ([764756c](https://github.com/PrivateAIM/helm/commit/764756cfc248b8ed421c99d2e122795caff1dc9e))
* **blaze:** migrate deployment to statefulset and update values for persistence ([4dd3a5e](https://github.com/PrivateAIM/helm/commit/4dd3a5ec31d3a2345a062ca3ad6c4a37f30d0603))
* **certs:** add support for providing additional CA certs ([c5850ba](https://github.com/PrivateAIM/helm/commit/c5850ba212e53ba6a6f86a39555ea675b88aeeb2))
* flatten chart structure ([4ab8116](https://github.com/PrivateAIM/helm/commit/4ab811668a8f81e62796d14820fcf55f6380772b))
* **headless:** add headless mode to HA and values ([a5b4250](https://github.com/PrivateAIM/helm/commit/a5b42502f4a9f36cb86986b9d282bdb282d3b189))
* **idp:** add support for separate user IDP and update global values ([21f8655](https://github.com/PrivateAIM/helm/commit/21f865558e53c6e8e9857ecf17e2936d7b1bab7e))
* integrate message broker into flame-node chart ([34a955e](https://github.com/PrivateAIM/helm/commit/34a955e9d896c09a7df3b30ef4d402523f60be8c))
* integrate message broker into flame-node chart and begin consolidating helper functions ([794f5af](https://github.com/PrivateAIM/helm/commit/794f5aff915cc0f61901b2ce4a8dc8ceb52af1c3))
* integrate podOrc into flame-node chart and move postgresql to parent chart ([71dc262](https://github.com/PrivateAIM/helm/commit/71dc26276acf4f9a8b91ee9fa87f9a920c09589f))
* integrate result service into flame-node chart and move minio to parent chart ([de840a0](https://github.com/PrivateAIM/helm/commit/de840a0195eaa53d5050c61fd83f4c4596561e0f))
* integrate UI and hub adapter into flame-node chart ([e7d7360](https://github.com/PrivateAIM/helm/commit/e7d73604d6444fb03dbd6ac90c6affeebcbb637b))
* **keycloak:** enable microsvcs to user controller agnostic idp subpath ([bccf995](https://github.com/PrivateAIM/helm/commit/bccf9950858b1d4eaa6ef5a11dbb8f0aaba63da4))
* **kong:** use self-managed postgres instance rather than sub-chart ([935d11c](https://github.com/PrivateAIM/helm/commit/935d11c2f1f49fc865f5841e616321de32f6cdcf))
* **mb:** add new env vars for proxy ([927bb8d](https://github.com/PrivateAIM/helm/commit/927bb8d44b742f56450dff6a835a92db24c89a84))
* **proxy:** update hub-adapter to use forward proxy values ([2217215](https://github.com/PrivateAIM/helm/commit/22172154da4900fc8ecf91b76573fc512a945ed6))
* **results:** crypto private key passed as existing secret or value ([611babf](https://github.com/PrivateAIM/helm/commit/611babf54fcc70b5d39e6e2a87d47073eb4290f1))
* support opting out of bundled Keycloak deployment ([a971486](https://github.com/PrivateAIM/helm/commit/a97148624f193cb33faafdf9b50ce4c83e808f41))
* **ui:** add no proxy option to UI and values.yaml ([48ed48f](https://github.com/PrivateAIM/helm/commit/48ed48f4208ca0364dc53fe4a4cf17032ed2153c))


### Bug Fixes

* buggy pod orchestration rbac ([#8](https://github.com/PrivateAIM/helm/issues/8)) ([9e7831d](https://github.com/PrivateAIM/helm/commit/9e7831d0f37b5d7d7358a5d234a7dcb54539636b))
* **certs:** make certs configmap mount conditional ([17786ef](https://github.com/PrivateAIM/helm/commit/17786efa8fdb54726462fad09d6f6f4e49e309d0))
* **certs:** update MB envVar ([10ff742](https://github.com/PrivateAIM/helm/commit/10ff742f05a202e4ac85bc9c1752c02d7d0ca7cc))
* default image tags and pin image versions in values.yaml ([f42b09d](https://github.com/PrivateAIM/helm/commit/f42b09d163f906f71c90f4a6bb2728b9f24baedf))
* **ha:** set default idp endpoint to use k8s URI ([e35d57b](https://github.com/PrivateAIM/helm/commit/e35d57b74da7274f8cf3851fb6bc55c5d9d38405))
* helm values.yaml file ([82fbfb7](https://github.com/PrivateAIM/helm/commit/82fbfb7aa56debe36a593d7dd29bd8be2c823845))
* helper functions and revert message broker image ([e4aa990](https://github.com/PrivateAIM/helm/commit/e4aa99077306f7edff9a91d37487671a5ae91b7c))
* **keycloak:** add clientRoles for service1 in kc configmap ([3c9eee0](https://github.com/PrivateAIM/helm/commit/3c9eee010bc20e065062572221f893257b585469))
* **mb:** remove proxy env vars if no proxy is set ([54dbc26](https://github.com/PrivateAIM/helm/commit/54dbc26a0a9733373a7699f757b687ceeac20184))
* **node:** add postgres port value to keep PO happy ([5a7cb4d](https://github.com/PrivateAIM/helm/commit/5a7cb4dcfbd69affd8028ddef676a848d5290600))
* **node:** remove optional keycloak disable ([b18a139](https://github.com/PrivateAIM/helm/commit/b18a1395e82a31d5d5b0cd8a6fda29755fbe88ca))
* **proxy:** add missing proxy env vars and update value comments ([a3b3083](https://github.com/PrivateAIM/helm/commit/a3b30833604d7622e0b49b4b01e2969626152cd0))
* **svc:** use long form service names for backend calls ([c93566f](https://github.com/PrivateAIM/helm/commit/c93566fa4d3d30584908ee861da2dda19e6d8981))
* **values:** update image tag and pull policy ([f7ef056](https://github.com/PrivateAIM/helm/commit/f7ef0560d9fd0559149660dd1fb7026a7f0de27f))


### Performance Improvements

* **secrets:** improve secret lookup helper functions ([5be8b45](https://github.com/PrivateAIM/helm/commit/5be8b459e65b08f537cb3d0b15745daedde249f7))
