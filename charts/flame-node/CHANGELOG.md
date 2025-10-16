# Changelog

## [1.0.0](https://github.com/PrivateAIM/helm/compare/flame-node-0.2.1...flame-node-1.0.0) (2025-10-16)


### Bug Fixes

* annoying punkt ([fa44f34](https://github.com/PrivateAIM/helm/commit/fa44f343f119ee2790f815195013796c78bb6be6))
* annoying punkt ([e38c441](https://github.com/PrivateAIM/helm/commit/e38c441ddefc0390ea5eed35c67566028c299fcb))

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
