FROM fedora:36
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:36
RUN /bin/bash -c "rm /build.{sh,conf}"
