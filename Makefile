RH_DIRS = centos-7 fedora-27 fedora-28 fedora-29 fedora-rawhide
RH_BUILD_SCRIPTS = $(RH_DIRS:=/build.sh)
RH_BUILD_CONFS = $(RH_DIRS:=/build.conf)
RH_DOCKERFILES = $(RH_DIRS:=/Dockerfile)

all: $(RH_DIRS) $(RH_BUILD_SCRIPTS) $(RH_BUILD_CONFS) $(RH_DOCKERFILES)

$(RH_DIRS):
	mkdir $@

$(RH_BUILD_SCRIPTS): rh-build.sh
	cp $< $@

$(RH_BUILD_CONFS): rh-build.conf
	cp $< $@

$(RH_DOCKERFILES): rh-Dockerfile
	sed -e 's,[@]IMAGE[@],$(patsubst %/,%,$(subst -,:,$(dir $@))),' $< > $@
