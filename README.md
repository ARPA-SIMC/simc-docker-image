[![Build Status](https://badges.herokuapp.com/travis/ARPA-SIMC/simc-docker-image?branch=master&env=DOCKER_IMAGE=centos:7&label=centos7)](https://travis-ci.org/ARPA-SIMC/simc-docker-image)
[![Build Status](https://badges.herokuapp.com/travis/ARPA-SIMC/simc-docker-image?branch=master&env=DOCKER_IMAGE=centos:8&label=centos8)](https://travis-ci.org/ARPA-SIMC/simc-docker-image)
[![Build Status](https://badges.herokuapp.com/travis/ARPA-SIMC/simc-docker-image?branch=master&env=DOCKER_IMAGE=fedora:31&label=fedora31)](https://travis-ci.org/ARPA-SIMC/simc-docker-image)
[![Build Status](https://badges.herokuapp.com/travis/ARPA-SIMC/simc-docker-image?branch=master&env=DOCKER_IMAGE=fedora:32&label=fedora32)](https://travis-ci.org/ARPA-SIMC/simc-docker-image)
[![Build Status](https://badges.herokuapp.com/travis/ARPA-SIMC/simc-docker-image?branch=master&env=DOCKER_IMAGE=fedora:33&label=fedora33)](https://travis-ci.org/ARPA-SIMC/simc-docker-image)
[![Build Status](https://badges.herokuapp.com/travis/ARPA-SIMC/simc-docker-image?branch=master&env=DOCKER_IMAGE=fedora:rawhide&label=fedorarawhide)](https://travis-ci.org/ARPA-SIMC/simc-docker-image)

# Arpae-SIMC docker image

Docker image with Arpae-SIMC software.

The default configuration builds an image with all the software needed at
Arpae-SIMC, without development packages.

## Dockerhub repositories

### CentOS

![Docker Automated](https://img.shields.io/docker/automated/arpaesimc/centos.svg)
![Docker Build](https://img.shields.io/docker/build/arpaesimc/centos.svg)

https://hub.docker.com/repository/docker/arpaesimc/centos

### Fedora

![Docker Automated](https://img.shields.io/docker/automated/arpaesimc/fedora.svg)
![Docker Build](https://img.shields.io/docker/build/arpaesimc/fedora.svg)

https://hub.docker.com/repository/docker/arpaesimc/fedora

## Manual build

You can modify `build.conf` to customize the image (see below).

To update the Dockerfiles

```
make
```

To build one of the images:

```
docker build -t NAME:TAG DIRECTORY
```

E.g.

```
docker build -t arpaesimc/fedora:28 fedora-28
```


## Configuration

`build.conf` is the configuration file.

* `COPR`: one or more Copr repository.
* `PACKAGES`: packages to install from the enabled repositories.
* `GITREF`: associative array. The keys are the Arpae-SIMC repositories and
  the value is the git commit, branch or tag from which the package is built
  (if a key is missing it will be installed the version from repository).
  E.g. `GITREF[wreport]=master`.
