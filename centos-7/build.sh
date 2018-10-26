#!/bin/bash
set -uex

source "$1"

distro="$2"

if [[ "$distro" == centos ]]
then
    sed -i '/^tsflags=/d' /etc/yum.conf
    yum install -y epel-release
    yum install -y @buildsys-build
    yum install -y yum-utils
    yum install -y yum-plugin-copr
    yum install -y git
    for copr in $COPR
    do
        yum copr enable -y $copr epel-7
    done
elif [[ "$distro" == fedora ]]
then
    sed -i '/^tsflags=/d' /etc/dnf/dnf.conf
    dnf install -y @buildsys-build
    dnf install -y 'dnf-command(builddep)'
    dnf install -y git
    for copr in $COPR
    do
        dnf copr enable -y $copr
    done
else
    echo "$distro is not a supported Linux distribution" >&2
    exit 1
fi

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
