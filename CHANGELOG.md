# Changelog

## 1.0.0 (2025-10-16)


### Features

* **adapter:** add offline param to hub adapter values ([81b710a](https://github.com/PrivateAIM/helm/commit/81b710a6039332e92e0c37643a572f38a6f6a2c1))
* add charts directory from hub repositoryÂ ([6d55170](https://github.com/PrivateAIM/helm/commit/6d551708b627abe3d8f0ceef91ffc8fe394f908e))
* add conventional Helm values as in 'helm create' ([19c7d1f](https://github.com/PrivateAIM/helm/commit/19c7d1f082330596233fa619151fddc247b3e3b1))
* add cookie domain env to third-party authup ([83dc3cd](https://github.com/PrivateAIM/helm/commit/83dc3cd840c569c53ac9ab3f9f7ac2ea4b6eff99))
* add ingress config to hub client-ui ([1fa1671](https://github.com/PrivateAIM/helm/commit/1fa1671b2c6af3c40e605050fd075e9004db4abb))
* add monitoring capabilities to hub deployment ([#38](https://github.com/PrivateAIM/helm/issues/38)) ([ceda045](https://github.com/PrivateAIM/helm/commit/ceda045fc7ba05d18dcf29762425703481a14c2d))
* add node helm charts ([764756c](https://github.com/PrivateAIM/helm/commit/764756cfc248b8ed421c99d2e122795caff1dc9e))
* add release please configuration ([aa6af2b](https://github.com/PrivateAIM/helm/commit/aa6af2ba3ae0fe0f5b360271219a646a26e642f0))
* add release-please configuration ([b348fe1](https://github.com/PrivateAIM/helm/commit/b348fe177ca845c942b7e439ab60d0708b66b110))
* add unique flame-component label ([11085c7](https://github.com/PrivateAIM/helm/commit/11085c72627cc3eaf706ae6c367ae6d898a4b72b))
* additional offline env vars for UI and HA ([e136410](https://github.com/PrivateAIM/helm/commit/e136410caaef4367115a71ec2808fbebbf2f184a))
* allow specifying default master images branch ([6bdafbd](https://github.com/PrivateAIM/helm/commit/6bdafbda9203835a374bb951ffcf53f61bdf3dbb))
* **blaze:** migrate deployment to statefulset and update values for persistence ([4dd3a5e](https://github.com/PrivateAIM/helm/commit/4dd3a5ec31d3a2345a062ca3ad6c4a37f30d0603))
* **broker:** working forward proxy ([295e887](https://github.com/PrivateAIM/helm/commit/295e88705f93519e1e40b2c06c9216c3fb1a1e11))
* bump dependency versions ([5f55c6a](https://github.com/PrivateAIM/helm/commit/5f55c6a75726f27063b9019cb5aabaa8118e354b))
* **certs:** add support for providing additional CA certs ([c5850ba](https://github.com/PrivateAIM/helm/commit/c5850ba212e53ba6a6f86a39555ea675b88aeeb2))
* checkout git & set default git details ([20d16e2](https://github.com/PrivateAIM/helm/commit/20d16e26ca489344841b4afd9abbeb47f0655ad5))
* flatten chart structure ([4ab8116](https://github.com/PrivateAIM/helm/commit/4ab811668a8f81e62796d14820fcf55f6380772b))
* harden chart dependency image versions ([9832584](https://github.com/PrivateAIM/helm/commit/98325849ca719c5724647601fb9b58e807369ffc))
* **ha:** update env vars to allow for other internal IDPs ([fc9e067](https://github.com/PrivateAIM/helm/commit/fc9e067a5e3558e46810ec9716cef8577b212572))
* **headless:** add headless mode to HA and values ([a5b4250](https://github.com/PrivateAIM/helm/commit/a5b42502f4a9f36cb86986b9d282bdb282d3b189))
* **idp:** add support for separate user IDP and update global values ([21f8655](https://github.com/PrivateAIM/helm/commit/21f865558e53c6e8e9857ecf17e2936d7b1bab7e))
* init project from source ([91d5b21](https://github.com/PrivateAIM/helm/commit/91d5b2140f30330f131173d7986a6315a310d8e8))
* initial harbor integration ([64fe8ec](https://github.com/PrivateAIM/helm/commit/64fe8ecbf0a512afc07c2a0e675f2196f13353f9))
* integrate hevi action ([5836dbd](https://github.com/PrivateAIM/helm/commit/5836dbd43eb963cc2835069c0bd21d2a884a9844))
* integrate message broker into flame-node chart ([34a955e](https://github.com/PrivateAIM/helm/commit/34a955e9d896c09a7df3b30ef4d402523f60be8c))
* integrate message broker into flame-node chart and begin consolidating helper functions ([794f5af](https://github.com/PrivateAIM/helm/commit/794f5aff915cc0f61901b2ce4a8dc8ceb52af1c3))
* integrate podOrc into flame-node chart and move postgresql to parent chart ([71dc262](https://github.com/PrivateAIM/helm/commit/71dc26276acf4f9a8b91ee9fa87f9a920c09589f))
* integrate result service into flame-node chart and move minio to parent chart ([de840a0](https://github.com/PrivateAIM/helm/commit/de840a0195eaa53d5050c61fd83f4c4596561e0f))
* integrate UI and hub adapter into flame-node chart ([e7d7360](https://github.com/PrivateAIM/helm/commit/e7d73604d6444fb03dbd6ac90c6affeebcbb637b))
* integrated telemetry service ([0290265](https://github.com/PrivateAIM/helm/commit/0290265b3a15dbaa5fd8ede3fd52804ca905a803))
* introduce appGroup metadata label for hub services ([238a7ef](https://github.com/PrivateAIM/helm/commit/238a7efdc8246f1e44150895347da51ce4a7b18a))
* **keycloak:** enable microsvcs to user controller agnostic idp subpath ([bccf995](https://github.com/PrivateAIM/helm/commit/bccf9950858b1d4eaa6ef5a11dbb8f0aaba63da4))
* **kong:** use self-managed postgres instance rather than sub-chart ([935d11c](https://github.com/PrivateAIM/helm/commit/935d11c2f1f49fc865f5841e616321de32f6cdcf))
* manage pull-policy via values.yaml configuration ([d5fe904](https://github.com/PrivateAIM/helm/commit/d5fe904ac84ed0d79fe7a9a50919c2d11542dd76))
* **mb:** add new env vars for proxy ([927bb8d](https://github.com/PrivateAIM/helm/commit/927bb8d44b742f56450dff6a835a92db24c89a84))
* merge hub charts ([#50](https://github.com/PrivateAIM/helm/issues/50)) ([3f82eac](https://github.com/PrivateAIM/helm/commit/3f82eacd2b385ff47ca2332c157c3312a288c691))
* pass loki component urls to container ([c51670f](https://github.com/PrivateAIM/helm/commit/c51670fa6e0a9fa649721f153ae9cfa35a7a773a))
* pass loki distributor url to telemetry service ([0c2f03e](https://github.com/PrivateAIM/helm/commit/0c2f03e3cdd57b3be496896b31e859b1c687ed39))
* pass rabbitmq connection string to storage & messenger service ([9435dfd](https://github.com/PrivateAIM/helm/commit/9435dfd601ca79e8b79c43d9894fb1100762bc0b))
* prefix helm charts ([03f24a1](https://github.com/PrivateAIM/helm/commit/03f24a1f67e2c58d423cd754b0684e934a0ac9b7))
* **proxy:** update hub-adapter to use forward proxy values ([2217215](https://github.com/PrivateAIM/helm/commit/22172154da4900fc8ecf91b76573fc512a945ed6))
* **proxy:** update result service to use forward proxy values ([310a7fa](https://github.com/PrivateAIM/helm/commit/310a7fa027964f2190a19c97ef49cf9590256045))
* **proxy:** working message broker proxy options ([a4109b0](https://github.com/PrivateAIM/helm/commit/a4109b0462a1705f41cb3cbefdc845195a17d7e9))
* remove flame-hub-shared chart ([7cec5a3](https://github.com/PrivateAIM/helm/commit/7cec5a3318e0c015beac1557073b8aff747e7db3))
* **results:** crypto private key passed as existing secret or value ([611babf](https://github.com/PrivateAIM/helm/commit/611babf54fcc70b5d39e6e2a87d47073eb4290f1))
* shared configuration ([623600a](https://github.com/PrivateAIM/helm/commit/623600aac22a27e5c893fef35f0959fa0cd16091))
* suggest helm repository index in README.md ([8d4831f](https://github.com/PrivateAIM/helm/commit/8d4831f97963a4edab8c33b6881f71512f44362b))
* support cookie domain for hub client-ui ([18b17cb](https://github.com/PrivateAIM/helm/commit/18b17cbae14f6f5520a9b659f65ff475be7a69c7))
* support opting out of bundled Keycloak deployment ([a971486](https://github.com/PrivateAIM/helm/commit/a97148624f193cb33faafdf9b50ce4c83e808f41))
* support public url for authup service ([9462906](https://github.com/PrivateAIM/helm/commit/94629067c81e72146b41f50146f51853a0ebe358))
* **ui:** add no proxy option to UI and values.yaml ([48ed48f](https://github.com/PrivateAIM/helm/commit/48ed48f4208ca0364dc53fe4a4cf17032ed2153c))
* **ui:** add proxy configuration to UI deploy ([5020b48](https://github.com/PrivateAIM/helm/commit/5020b48ef80660f9aee51e24ba0b8b42d3ce128a))
* updated external dependencies, ssl support & liveness probe adjustments ([28203dc](https://github.com/PrivateAIM/helm/commit/28203dc3da2327f66f3024ac320d5d91eaceedfc))
* use app chart version in hub deployments ([#9](https://github.com/PrivateAIM/helm/issues/9)) ([14d6757](https://github.com/PrivateAIM/helm/commit/14d67578c6b29ddd93c34123d200e49cd2b50d29))


### Bug Fixes

* add checksum for secrets in PO deployment ([03332ca](https://github.com/PrivateAIM/helm/commit/03332ca12fcae823cb09ab79bfcf8424afe31106))
* add checksum to PO deploy to check for updated secrets during a helm upgrade ([4edfdc6](https://github.com/PrivateAIM/helm/commit/4edfdc68f60288f9bbb7934f55e6115fbd972b36))
* add checksum to trigger pod recreation if secret changes ([7aa524f](https://github.com/PrivateAIM/helm/commit/7aa524f9b36c4e65e4efc285c8f908177c2ad195))
* add checksum to trigger pod recreation if secret changes ([a37d2b8](https://github.com/PrivateAIM/helm/commit/a37d2b8c411abd1d90379f67bd9926f088f40f90))
* add labels to services ([f59b226](https://github.com/PrivateAIM/helm/commit/f59b22660986fa941181e20a1e2f60c084608033))
* add missing ingress path / for authup ([0f61334](https://github.com/PrivateAIM/helm/commit/0f61334f1faa7a3b01f4550d6cfe9cbc4657ed28))
* add missing matchLabels ([c2c374b](https://github.com/PrivateAIM/helm/commit/c2c374b18c36308d411e2f64c4f7726a396db3d1))
* add missing port number in storage deployment ([fc71e64](https://github.com/PrivateAIM/helm/commit/fc71e642b0dbe6ad9195d53148a0096b07380048))
* add security context to analysis-manager ([922da92](https://github.com/PrivateAIM/helm/commit/922da92673a014ede9d5dd9136c423b673edbe2f))
* annoying punkt ([fa44f34](https://github.com/PrivateAIM/helm/commit/fa44f343f119ee2790f815195013796c78bb6be6))
* annoying punkt ([e38c441](https://github.com/PrivateAIM/helm/commit/e38c441ddefc0390ea5eed35c67566028c299fcb))
* buggy pod orchestration rbac ([#8](https://github.com/PrivateAIM/helm/issues/8)) ([9e7831d](https://github.com/PrivateAIM/helm/commit/9e7831d0f37b5d7d7358a5d234a7dcb54539636b))
* **certs:** make certs configmap mount conditional ([17786ef](https://github.com/PrivateAIM/helm/commit/17786efa8fdb54726462fad09d6f6f4e49e309d0))
* **certs:** update MB envVar ([10ff742](https://github.com/PrivateAIM/helm/commit/10ff742f05a202e4ac85bc9c1752c02d7d0ca7cc))
* convert metadata annotation value to string ([ac77dea](https://github.com/PrivateAIM/helm/commit/ac77dea5f97ab390fe0eab0b44c391f4355ab9ec))
* default image tags and pin image versions in values.yaml ([f42b09d](https://github.com/PrivateAIM/helm/commit/f42b09d163f906f71c90f4a6bb2728b9f24baedf))
* extend default values file ([2d7ee59](https://github.com/PrivateAIM/helm/commit/2d7ee59661bb024d68bbac75996c831dfd33c6fb))
* extended root README.md ([e3f6df8](https://github.com/PrivateAIM/helm/commit/e3f6df8703116adef0d555f5b657c42ac585c0f8))
* grafana-loki memcached image repository & tag ([f570494](https://github.com/PrivateAIM/helm/commit/f5704943464005d72a4a0e02c6047746a1ea3ae4))
* **ha:** set default idp endpoint to use k8s URI ([e35d57b](https://github.com/PrivateAIM/helm/commit/e35d57b74da7274f8cf3851fb6bc55c5d9d38405))
* helm values.yaml file ([82fbfb7](https://github.com/PrivateAIM/helm/commit/82fbfb7aa56debe36a593d7dd29bd8be2c823845))
* helper functions and revert message broker image ([e4aa990](https://github.com/PrivateAIM/helm/commit/e4aa99077306f7edff9a91d37487671a5ae91b7c))
* image arg for core-worker & prometheus static config ([592b6d2](https://github.com/PrivateAIM/helm/commit/592b6d2e712749e1c41b3f11cf9dd2ec373c6ab3))
* initContainers and urls for server-telemetry deployment ([0e86809](https://github.com/PrivateAIM/helm/commit/0e868095112d4e2d057f7e1dd665d7d33dadb623))
* **keycloak:** add clientRoles for service1 in kc configmap ([3c9eee0](https://github.com/PrivateAIM/helm/commit/3c9eee010bc20e065062572221f893257b585469))
* **mb:** remove proxy env vars if no proxy is set ([54dbc26](https://github.com/PrivateAIM/helm/commit/54dbc26a0a9733373a7699f757b687ceeac20184))
* nginx max body size for storage service ([34df94b](https://github.com/PrivateAIM/helm/commit/34df94ba3999ecb6b81eee7f29b353a811f957d6))
* **node:** add postgres port value to keep PO happy ([5a7cb4d](https://github.com/PrivateAIM/helm/commit/5a7cb4dcfbd69affd8028ddef676a848d5290600))
* **node:** remove optional keycloak disable ([b18a139](https://github.com/PrivateAIM/helm/commit/b18a1395e82a31d5d5b0cd8a6fda29755fbe88ca))
* **po:** update component labels ([4116e50](https://github.com/PrivateAIM/helm/commit/4116e503065051b6403d83b6ad72c93d39f2ccbd))
* **proxy:** add missing proxy env vars and update value comments ([a3b3083](https://github.com/PrivateAIM/helm/commit/a3b30833604d7622e0b49b4b01e2969626152cd0))
* quotes in cookie domain variable assignment ([a93a6ed](https://github.com/PrivateAIM/helm/commit/a93a6eda76daade4e09453bde2190f33b1627929))
* remove charts directory ([3c6ba4d](https://github.com/PrivateAIM/helm/commit/3c6ba4d1c5e6a99e4b38260c6de74a9e197e1519))
* remove flame-hub-shared from dependency list ([e69bc50](https://github.com/PrivateAIM/helm/commit/e69bc50de4dadf87afb46e9bfec953a03639a39f))
* remove single indent ([d5eb50a](https://github.com/PrivateAIM/helm/commit/d5eb50a267cdcf973aee899a8d12cbd691933e46))
* rename release please config file ([d7f68c1](https://github.com/PrivateAIM/helm/commit/d7f68c153380a41c63ef6bbc7dac022f324b9354))
* **result:** update result deployment to use new env vars ([b0324cf](https://github.com/PrivateAIM/helm/commit/b0324cf1839d0201f6760440a37554447e0d0ba8))
* serving grafana ui ([2dc5582](https://github.com/PrivateAIM/helm/commit/2dc558281d575920c47e0bde6f559ea94435848f))
* set alloy image repository & tag ([8f6bb0e](https://github.com/PrivateAIM/helm/commit/8f6bb0efb19c27376f05f3d954723386054b92a7))
* set default path to / ([0842b0e](https://github.com/PrivateAIM/helm/commit/0842b0e483fcdd6b186ec0472d51d1e44e6cdd03))
* set docker sock to socket type ([184880b](https://github.com/PrivateAIM/helm/commit/184880befec4dbdf7c0d5ad575c745889e4f9fc2))
* set memcachedchunks repository of grafana-loki ([9a7a124](https://github.com/PrivateAIM/helm/commit/9a7a1245d68f70ece6b9822709ed2bba93dcee10))
* set volume hostPath type to File ([95e710c](https://github.com/PrivateAIM/helm/commit/95e710c32b73b2b9a8b40634c802a606ce4e1639))
* **svc:** use long form service names for backend calls ([c93566f](https://github.com/PrivateAIM/helm/commit/c93566fa4d3d30584908ee861da2dda19e6d8981))
* update .gitignore file ([a0c9d8f](https://github.com/PrivateAIM/helm/commit/a0c9d8f266b6ba707066e06c2f99b168cd8b7eaa))
* **values:** update image tag and pull policy ([f7ef056](https://github.com/PrivateAIM/helm/commit/f7ef0560d9fd0559149660dd1fb7026a7f0de27f))


### Performance Improvements

* **secrets:** improve secret lookup helper functions ([5be8b45](https://github.com/PrivateAIM/helm/commit/5be8b459e65b08f537cb3d0b15745daedde249f7))


### Reverts

* move datastore chart to top level again for merge ([02743f8](https://github.com/PrivateAIM/helm/commit/02743f8ec5e48eaa09cb61643f70481f171bb4d3))
* **results:** set result-service to previous sha ([a81ff6d](https://github.com/PrivateAIM/helm/commit/a81ff6d314903a4ca50bba3e733f48ce8e32d5d7))

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
