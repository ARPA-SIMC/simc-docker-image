FROM fedora:28
COPY build.sh /
COPY build.conf /
RUN /bin/bash /build.sh /build.conf
