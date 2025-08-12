FROM quay.io/fedora/fedora:rawhide AS builder

RUN dnf install -y autoconf automake bash binutils clang gawk git-core make musl-clang

COPY components /work/components
COPY build-component.sh /work
COPY build-all.sh /work

RUN cd /work && \
    env CC=musl-clang CXX=musl-clang bash build-all.sh

FROM scratch

COPY --from=builder /work/rootfs /

CMD ["/bin/sh"]
