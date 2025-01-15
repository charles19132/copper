# minimalrootfs

A simple environment. Contains only musl, dash, and sbase.

I guess it's perfect to run (extremely basic) shell scripts or C programs.

## Using

We have a container image ([`git.disroot.org/charles8191/minimalrootfs`](https://git.disroot.org/charles8191/minimalrootfs/packages)). If you'd like a rootfs, read [rootfs](#rootfs):

## Building

### Container

If you want a container, just build the Containerfile using Docker or podman:

```sh
docker build -t minimalrootfs .
```

### rootfs

If you want a rootfs, you can just extract the container image, but if that's too easy for you, you can do it manually:

1. Make sure you have Alpine Linux on your host.

2. Install the following packages:

```sh
apk add alpine-sdk automake autoconf bash
```

3. Run the `./build.sh` script:

```sh
./build.sh
```

4. Pray it doesn't break your system, and you will have a rootfs folder that you can chroot into.
