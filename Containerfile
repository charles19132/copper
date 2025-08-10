FROM quay.io/fedora/fedora:rawhide AS builder

RUN dnf install -y autoconf automake bash binutils clang gawk git make musl-clang

COPY components /work/components
COPY build-component.sh /work
COPY build.sh /work

RUN cd /work && \
    env CC=musl-clang CXX=musl-clang bash build.sh

FROM scratch

COPY --from=builder /work/rootfs /

CMD ["/bin/sh"]
