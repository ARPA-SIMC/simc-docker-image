#!/bin/bash
set -uex

source "$1"

distro="$2"

apt-get update
apt-get -y upgrade
apt-get -y install ca-certificates

if [[ "$distro" == ubuntu:jammy ]]
then
    sed -i -re 's/main$/main universe/' /etc/apt/sources.list
    echo "deb [trusted=yes] https://simc.arpae.it/packages/debian jammy main" > /etc/apt/sources.list.d/arpae-simc.list
else
    echo "$distro is not a supported Linux distribution" >&2
    exit 1
fi

apt-get update

if [[ ${#GITREF[@]} -gt 0 ]]
then
    echo "Snapshot build not already supported"
    exit 1
fi

apt-get -y install ${PACKAGES}
