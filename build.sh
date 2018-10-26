#!/bin/bash
set -uex

source "$1"

sed -i '/^tsflags=/d' /etc/dnf/dnf.conf
dnf install -y @buildsys-build
dnf install -y 'dnf-command(builddep)'
dnf install -y git
dnf copr enable -y $COPR

mkdir src
pushd src

for repo in wreport dballe meteo-vm2 arkimet libsim
do
    ref=${GITREF[$repo]:-}
    [[ -z "$ref" ]] && continue
    git clone http://github.com/arpa-simc/$repo
    pushd $repo
    git checkout $ref
    bash .travis-build.sh fedora:28
    find ~/rpmbuild/RPMS -name "*.rpm" -print0 | xargs -0 dnf install -y
    popd # $repo
done

popd # src
rm -rf src

dnf install -y ${PACKAGES}
