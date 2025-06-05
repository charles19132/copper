FROM docker.io/library/debian:12-slim AS builder
RUN apt-get clean && env DEBIAN_FRONTEND=noninteractive apt-get install automake autoconf bash build-essential git musl-tools
COPY components /work/components
COPY build.sh /work
RUN cd /work && \
    env CC=musl-gcc CXX=musl-gcc bash build.sh

FROM scratch
COPY --from=builder /work/rootfs /
CMD ["/bin/sh"]
