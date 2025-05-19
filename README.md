# minimalrootfs

A simple environment. Contains only musl, dash, and sbase.

Can be relatively easy to extend and make an entire userspace.

## Using

Build the container image. If you'd like a rootfs, read [rootfs](#rootfs):

## Building

### Container

If you want a container, just build the Containerfile using podman:

```sh
podman build -t minimalrootfs .
```

### rootfs

If you want a rootfs, you can just extract the container image, but if that's too easy for you, you can do it manually:

1. Make sure you have Alpine Linux on your host.

2. Install the following packages:

```sh
apk add alpine-sdk automake autoconf bash git
```

3. Run the `build.sh` script:

```sh
bash build.sh
```

4. Pray it doesn't break your system, and you will have a rootfs folder that you can chroot into.
