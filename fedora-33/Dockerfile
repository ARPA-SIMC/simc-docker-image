FROM fedora:33
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf fedora:33
RUN /bin/bash -c "rm /build.{sh,conf}"
