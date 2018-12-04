RH_DIRS = centos-7 fedora-27 fedora-28 fedora-29 fedora-rawhide
RH_BUILD_SCRIPTS = $(RH_DIRS:=/build.sh)
RH_BUILD_CONFS = $(RH_DIRS:=/build.conf)

all: $(RH_BUILD_SCRIPTS) $(RH_BUILD_CONFS)

$(RH_BUILD_SCRIPTS): rh-build.sh
	cp $< $@

$(RH_BUILD_CONFS): rh-build.conf
	cp $< $@