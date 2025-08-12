# Copper

Copper is a very simple Linux userspace that can be very easily adapted.

> [!IMPORTANT]
> Copper is only the userspace. To make a full device image, you will need to supply your own kernel (and a bootloader if needed).

## Pre-built

A [pre-built container image](https://github.com/charles19132/copper/pkgs/container/copper) is available.

## Building

### Container

If you want a container, simply build the Containerfile using podman:

```sh
podman build -t copper .
```

### rootfs

If you want a rootfs, you can extract the container image, but you can also do it manually:

1. Install the following packages (or equivalent depending on your distribution). You may need more if you add more components.

- autoconf
- automake
- bash
- binutils
- clang
- gawk
- git-core
- make
- musl-clang

2. Run the `build-all.sh` script:

```sh
env CC=clang CXX=clang bash build-all.sh
```

> [!TIP]
> Although the previous command works on musl systems, you can build on a glibc system if you run this command instead:
> ```sh
> env CC=musl-clang CXX=musl-clang bash build-all.sh
> ```

3. You should have a rootfs folder that you can deploy or use with chroot.

## Adding a component

1. Create a file in `components`, ending with `.sh`.

2. Then edit this script to match your needs.

> [!TIP]
> You can also use the existing components as reference.

```bash
#!/bin/bash
set -euxo pipefail

prepare() {
  # Put the source code in source.tmp.
}

build() {
  # Build steps. No need to change the directory to source.tmp for this step.
}

copy() {
  # Make sure to make the folders needed if they don't exist.
  # For example, for /bin:
  # test -d rootfs/bin || mkdir -p rootfs/bin

  # Copy the file(s) from source.tmp to rootfs.
}
```

3. Save the file.

## Changing compiler flags

You can specify custom C or C++ compiler flags using the `CFLAGS` and `CXXFLAGS` environment variables respectively.

For linker flags, you should use the `LDFLAGS` environment variable.

## Building a single component

You can build a component seperately by following this command:

```sh
bash build-component.sh "components/<COMPONENT>.sh"
```

Make sure to change `<COMPONENT>` to the actual name of the component.

Note that unlike `build-all.sh`, `build-component.sh` does not delete the `rootfs` folder automatically when starting.