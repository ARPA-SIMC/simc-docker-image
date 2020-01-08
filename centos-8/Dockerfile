FROM centos:8
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf centos:8
RUN /bin/bash -c "rm /build.{sh,conf}"
