FROM alpine:edge AS builder
ENV CFLAGS="-s -Os -Wl,--gc-sections" CXXFLAGS="-s -Os -Wl,--gc-sections"
COPY . /work
RUN apk add alpine-sdk automake autoconf bash && \
    cd /work && \
    ./build.sh
FROM scratch
COPY --from=builder /work/rootfs /
CMD ["/bin/sh"]
