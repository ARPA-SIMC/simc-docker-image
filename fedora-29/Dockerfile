FROM fedora:29
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora
RUN /bin/bash -c "rm /build.{sh,conf}"
