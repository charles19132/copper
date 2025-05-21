# minimalrootfs

A simple environment.

Relatively easy to extend and make an entire userspace.

## Using

Use a [pre-built container image](https://quay.io/charles2/minimalrootfs), or [build a container image](#building). Or you can build a [rootfs](#rootfs):

## Building

### Container

If you want a container, just build the Containerfile using podman:

```sh
podman build -t minimalrootfs .
```

### rootfs

If you want a rootfs, you can just extract the container image, but you can do it manually:

1. Make sure you have Alpine Linux on your host.

2. Install the following packages:

```sh
apk add alpine-sdk automake autoconf bash git
```

3. Run the `build.sh` script:

```sh
bash build.sh
```

4. You should have a rootfs folder that you can chroot into.
