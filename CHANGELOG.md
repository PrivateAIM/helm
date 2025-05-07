# Changelog

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
