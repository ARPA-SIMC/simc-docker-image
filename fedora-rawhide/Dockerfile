FROM fedora:rawhide
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:rawhide
RUN /bin/bash -c "rm /build.{sh,conf}"
