# Copper

Copper is a very simple Linux userspace that can be very easily adapted.

## Pre-built

A [pre-built container image](https://quay.io/repository/charles2/copper) is available.

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

3. You should have a rootfs folder that you can deploy or use with chroot.

## Adding a component

1. Create a file in `components`, ending with `.sh`.

2. Then edit this content to match your needs.

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
  # Copy the file(s) from source.tmp to rootfs.
}
```

3. Save the file.

4. If needed, you can edit the `mkdir -p` line in `build.sh` to create the directories needed for your component (for example, `/etc`).