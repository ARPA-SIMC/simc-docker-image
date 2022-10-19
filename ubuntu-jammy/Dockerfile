FROM ubuntu:jammy
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf ubuntu:jammy
RUN /bin/bash -c "rm /build.{sh,conf}"
