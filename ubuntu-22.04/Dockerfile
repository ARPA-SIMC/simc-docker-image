FROM ubuntu:22.04
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf ubuntu:22.04
RUN /bin/bash -c "rm /build.{sh,conf}"
