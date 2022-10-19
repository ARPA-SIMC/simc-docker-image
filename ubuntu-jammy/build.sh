#!/bin/bash
set -uex

source "$1"

distro="$2"

if [[ "$distro" =~ ubuntu ]]
then
    sed -i -re 's/main$/main universe/' /etc/apt/sources.list
    apt-get update
elif [[ $distro =~ ^debian ]]
then
    :
else
    echo "$distro is not a supported Linux distribution" >&2
    exit 1
fi

apt-get install -y apt-utils
mkdir -p /packages/debs
cp -a /debs /packages/debs
pushd /packages
apt-ftparchive packages debs > Packages
popd
echo 'deb [trusted=yes] file:///packages ./' > /etc/apt/sources.list.d/tmp.list
apt-get update
apt-get remove -y apt-utils
apt-get autoremove -y

if [[ ${#GITREF[@]} -gt 0 ]]
then
    echo "Snapshot build not already supported"
    exit 1

    apt-get -y install build-essential dpkg-dev fakeroot git eatmydata

    mkdir src
    pushd src

    for repo in wreport dballe meteo-vm2 arkimet libsim
    do
        ref=${GITREF[$repo]:-}
        [[ -z "$ref" ]] && continue
        git clone http://github.com/arpa-simc/$repo
        pushd $repo
        git checkout $ref
        # bash .travis-build.sh $distro
        # find ~/rpmbuild/RPMS -name "*.rpm" -print0 | xargs -0 $pkgcmd install -y
        popd # $repo
    done

    popd # src
    rm -rf src
fi

apt-get -y install ${PACKAGES}

rm -rf /packages
rm /etc/apt/sources.list.d/tmp.list
apt-get update
