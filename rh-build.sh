#!/bin/bash
set -uex

source "$1"

distro="$2"

if [[ "$distro" =~ centos:7 ]]
then
    pkgcmd="yum"
    sed -i '/^tsflags=/d' /etc/yum.conf
    yum install -y epel-release
    yum install -y yum-plugin-copr
    for copr in $COPR
    do
        yum copr enable -y $copr epel-7
    done
elif [[ $distro =~ ^centos:8 ]]
then
    pkgcmd="dnf"
    builddep="dnf builddep"
    sed -i '/^tsflags=/d' /etc/dnf/dnf.conf
    dnf install -y epel-release
    for copr in $COPR
    do
        dnf copr enable -y $copr
    done
elif [[ "$distro" =~ fedora ]]
then
    pkgcmd="dnf"
    sed -i '/^tsflags=/d' /etc/dnf/dnf.conf
    for copr in $COPR
    do
        dnf copr enable -y $copr
    done
else
    echo "$distro is not a supported Linux distribution" >&2
    exit 1
fi

if [[ ${#GITREF[@]} -gt 0 ]]
then
    $pkgcmd install -y git

    mkdir src
    pushd src

    for repo in wreport dballe meteo-vm2 arkimet libsim
    do
        ref=${GITREF[$repo]:-}
        [[ -z "$ref" ]] && continue
        git clone http://github.com/arpa-simc/$repo
        pushd $repo
        git checkout $ref
        bash .travis-build.sh $distro
        find ~/rpmbuild/RPMS -name "*.rpm" -print0 | xargs -0 $pkgcmd install -y
        popd # $repo
    done

    popd # src
    rm -rf src
fi

$pkgcmd install -y ${PACKAGES}
