FROM alpine:edge AS builder
RUN apk add build-base automake autoconf bash git
COPY . /work
RUN cd /work && \
    bash build.sh
FROM scratch
COPY --from=builder /work/rootfs /
CMD ["/bin/sh"]
