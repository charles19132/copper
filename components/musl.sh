#!/bin/bash
set -euxo pipefail

prepare() {
  git clone --depth=1 --single-branch --branch=master git://git.musl-libc.org/musl source.tmp
}

build() {
  ./configure
  make -j$(nproc)
}

copy() {
  cp source.tmp/lib/libc.so rootfs/lib/ld-musl-$(uname -m).so.1
}