FROM ghcr.io/archlinux/archlinux:latest AS builder

RUN pacman -Sy --noconfirm autoconf automake bash binutils gawk gcc git make musl

COPY components /work/components
COPY build-component.sh /work
COPY build.sh /work

RUN cd /work && \
    env CC=musl-gcc CXX=musl-gcc bash build.sh

FROM scratch

COPY --from=builder /work/rootfs /

CMD ["/bin/sh"]
