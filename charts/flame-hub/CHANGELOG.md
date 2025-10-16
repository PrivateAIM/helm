# Changelog

## [1.0.0](https://github.com/PrivateAIM/helm/compare/flame-hub-0.1.0...flame-hub-1.0.0) (2025-10-16)


### Features

* add monitoring capabilities to hub deployment ([#38](https://github.com/PrivateAIM/helm/issues/38)) ([ceda045](https://github.com/PrivateAIM/helm/commit/ceda045fc7ba05d18dcf29762425703481a14c2d))
* bump dependency versions ([5f55c6a](https://github.com/PrivateAIM/helm/commit/5f55c6a75726f27063b9019cb5aabaa8118e354b))
* harden chart dependency image versions ([9832584](https://github.com/PrivateAIM/helm/commit/98325849ca719c5724647601fb9b58e807369ffc))
* initial harbor integration ([64fe8ec](https://github.com/PrivateAIM/helm/commit/64fe8ecbf0a512afc07c2a0e675f2196f13353f9))
* integrated telemetry service ([0290265](https://github.com/PrivateAIM/helm/commit/0290265b3a15dbaa5fd8ede3fd52804ca905a803))
* manage pull-policy via values.yaml configuration ([d5fe904](https://github.com/PrivateAIM/helm/commit/d5fe904ac84ed0d79fe7a9a50919c2d11542dd76))
* merge hub charts ([#50](https://github.com/PrivateAIM/helm/issues/50)) ([3f82eac](https://github.com/PrivateAIM/helm/commit/3f82eacd2b385ff47ca2332c157c3312a288c691))
* pass loki distributor url to telemetry service ([0c2f03e](https://github.com/PrivateAIM/helm/commit/0c2f03e3cdd57b3be496896b31e859b1c687ed39))
* pass rabbitmq connection string to storage & messenger service ([9435dfd](https://github.com/PrivateAIM/helm/commit/9435dfd601ca79e8b79c43d9894fb1100762bc0b))
* prefix helm charts ([03f24a1](https://github.com/PrivateAIM/helm/commit/03f24a1f67e2c58d423cd754b0684e934a0ac9b7))
* updated external dependencies, ssl support & liveness probe adjustments ([28203dc](https://github.com/PrivateAIM/helm/commit/28203dc3da2327f66f3024ac320d5d91eaceedfc))


### Bug Fixes

* buggy pod orchestration rbac ([#8](https://github.com/PrivateAIM/helm/issues/8)) ([9e7831d](https://github.com/PrivateAIM/helm/commit/9e7831d0f37b5d7d7358a5d234a7dcb54539636b))
* extend default values file ([2d7ee59](https://github.com/PrivateAIM/helm/commit/2d7ee59661bb024d68bbac75996c831dfd33c6fb))
* grafana-loki memcached image repository & tag ([f570494](https://github.com/PrivateAIM/helm/commit/f5704943464005d72a4a0e02c6047746a1ea3ae4))
* image arg for core-worker & prometheus static config ([592b6d2](https://github.com/PrivateAIM/helm/commit/592b6d2e712749e1c41b3f11cf9dd2ec373c6ab3))
* initContainers and urls for server-telemetry deployment ([0e86809](https://github.com/PrivateAIM/helm/commit/0e868095112d4e2d057f7e1dd665d7d33dadb623))
* remove flame-hub-shared from dependency list ([e69bc50](https://github.com/PrivateAIM/helm/commit/e69bc50de4dadf87afb46e9bfec953a03639a39f))
* serving grafana ui ([2dc5582](https://github.com/PrivateAIM/helm/commit/2dc558281d575920c47e0bde6f559ea94435848f))
* set alloy image repository & tag ([8f6bb0e](https://github.com/PrivateAIM/helm/commit/8f6bb0efb19c27376f05f3d954723386054b92a7))
* set memcachedchunks repository of grafana-loki ([9a7a124](https://github.com/PrivateAIM/helm/commit/9a7a1245d68f70ece6b9822709ed2bba93dcee10))
