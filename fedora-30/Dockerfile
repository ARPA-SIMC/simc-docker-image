FROM fedora:30
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:30
RUN /bin/bash -c "rm /build.{sh,conf}"
