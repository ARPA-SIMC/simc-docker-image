FROM fedora:27
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:27
RUN /bin/bash -c "rm /build.{sh,conf}"
