# Arpae-SIMC docker image

Docker image with Arpae-SIMC software.

The default configuration builds an image with all the software needed at
Arpae-SIMC, without development packages. You can modify `build.conf` to
customize the image (see above).

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
