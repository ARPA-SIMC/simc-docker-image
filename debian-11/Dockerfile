FROM debian:11
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf debian:11
RUN /bin/bash -c "rm /build.{sh,conf}"
