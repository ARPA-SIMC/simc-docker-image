FROM fedora:29
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:29
RUN /bin/bash -c "rm /build.{sh,conf}"
