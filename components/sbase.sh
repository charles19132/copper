#!/bin/bash
set -euxo pipefail

prepare() {
  git clone --depth=1 --single-branch --branch=master git://git.suckless.org/sbase source.tmp
}

build() {
  make -j$(nproc)
}

copy() {
  find source.tmp -maxdepth 1 -type f -executable -exec cp {} rootfs/bin \;
}