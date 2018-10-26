FROM centos:7
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf centos
RUN /bin/bash -c "rm /build.{sh,conf}"
