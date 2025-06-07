# minimalrootfs

A simple environment.

Relatively easy to extend and make an entire userspace.

## Pre-built

A [pre-built container image](https://quay.io/repository/charles2/minimalrootfs) is available.

## Building

### Container

If you want a container, just build the Containerfile using buildah:

```sh
buildah build -t minimalrootfs .
```

### rootfs

If you want a rootfs, you can just extract the container image, but you can do it manually:

1. Install the following packages (or equivalent depending on your distribution):

- autoconf
- automake
- awk
- bash
- binutils
- gcc
- git
- make
- musl-gcc (only needed if building on a glibc system)

2. Run the `build.sh` script:

```sh
bash build.sh
```

> [!TIP]
> Although the previous command works on musl systems, you can build on a glibc system if you run this command instead:
> ```sh
> env CC=musl-gcc CXX=musl-gcc bash build.sh
> ```

3. You should have a rootfs folder that you can chroot into.

## SBOM

There is a simple SBOM containing the commit for each component. It can be retrieved using the following methods.

### Container

```sh
podman run quay.io/charles2/minimalrootfs:latest cat /.sbom
```

### rootfs

```sh
chroot rootfs /bin/cat /.sbom
```

It is in the format of `key=value`, where `key` is the component name and `value` is the commit.
