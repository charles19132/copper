#!/bin/bash
set -euxo pipefail

prepare() {
  git clone git://git.musl-libc.org/musl source.tmp
  cd source.tmp
  git checkout v1.2.5
  cd ..
}

build() {
  ./configure
  make -j$(nproc)
}

copy() {
  cp source.tmp/lib/libc.so rootfs/lib/ld-musl-$(uname -m).so.1
}