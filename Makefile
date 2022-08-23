RH_DIRS = centos-7 rockylinux-8 fedora-36 fedora-rawhide
RH_BUILD_SCRIPTS = $(RH_DIRS:=/build.sh)
RH_BUILD_CONFS = $(RH_DIRS:=/build.conf)
RH_DOCKERFILES = $(RH_DIRS:=/Dockerfile)

DEB_DIRS = ubuntu-22.04 debian-11
DEB_BUILD_SCRIPTS = $(DEB_DIRS:=/build.sh)
DEB_BUILD_CONFS = $(DEB_DIRS:=/build.conf)
DEB_DOCKERFILES = $(DEB_DIRS:=/Dockerfile)

RH_ALL = $(RH_DIRS) $(RH_BUILD_SCRIPTS) $(RH_BUILD_CONFS) $(RH_DOCKERFILES)
DEB_ALL = $(DEB_DIRS) $(DEB_BUILD_SCRIPTS) $(DEB_BUILD_CONFS) $(DEB_DOCKERFILES)

all: $(RH_ALL) $(DEB_ALL)

$(RH_DIRS):
	mkdir $@

$(RH_BUILD_SCRIPTS): rh-build.sh
	cp $< $@

$(RH_BUILD_CONFS): rh-build.conf
	cp $< $@

$(RH_DOCKERFILES): rh-Dockerfile
	sed -e 's,[@]IMAGE[@],$(patsubst %/,%,$(subst -,:,$(dir $@))),' $< > $@

$(DEB_DIRS):
	mkdir $@

$(DEB_BUILD_SCRIPTS): deb-build.sh
	cp $< $@

$(DEB_BUILD_CONFS): deb-build.conf
	cp $< $@

$(DEB_DOCKERFILES): deb-Dockerfile
	sed -e 's,[@]IMAGE[@],$(patsubst %/,%,$(subst -,:,$(dir $@))),' $< > $@
