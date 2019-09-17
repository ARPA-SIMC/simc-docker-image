FROM fedora:32
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:32
RUN /bin/bash -c "rm /build.{sh,conf}"
