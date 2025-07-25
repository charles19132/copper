#!/bin/bash
set -euxo pipefail

prepare() {
  git clone git://git.suckless.org/sbase source.tmp
  cd source.tmp
  git checkout 0.1
  cd ..
}

build() {
  make -j$(nproc)
}

copy() {
  test -d rootfs/bin || mkdir -p rootfs/bin
  find source.tmp -maxdepth 1 -type f -executable -exec cp {} rootfs/bin \;
}
