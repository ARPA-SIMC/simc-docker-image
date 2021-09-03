FROM fedora:34
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:34
RUN /bin/bash -c "rm /build.{sh,conf}"
