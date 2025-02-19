FROM alpine:edge AS builder
COPY . /work
RUN apk add alpine-sdk automake autoconf bash && \
    cd /work && \
    ./build.sh
FROM scratch
COPY --from=builder /work/rootfs /
CMD ["/bin/sh"]
