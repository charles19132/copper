FROM quay.io/fedora/fedora:42 AS builder

RUN dnf install autoconf automake awk bash binutils gcc git make musl-gcc -y

COPY components /work/components
COPY build-component.sh /work
COPY build.sh /work

RUN cd /work && \
    env CC=musl-gcc CXX=musl-gcc bash build.sh

FROM scratch

COPY --from=builder /work/rootfs /

CMD ["/bin/sh"]