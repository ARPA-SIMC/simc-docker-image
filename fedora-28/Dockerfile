FROM fedora:28
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:28
RUN /bin/bash -c "rm /build.{sh,conf}"
