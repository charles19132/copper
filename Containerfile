FROM alpine:edge AS builder
RUN apk add automake autoconf bash build-base git
COPY components /work/components
COPY build.sh /work
RUN cd /work && \
    bash build.sh
FROM scratch
COPY --from=builder /work/rootfs /
CMD ["/bin/sh"]
