FROM fedora:31
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:31
RUN /bin/bash -c "rm /build.{sh,conf}"
