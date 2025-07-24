#!/bin/bash
set -euxo pipefail

prepare() {
  git clone git://git.kernel.org/pub/scm/utils/dash/dash.git source.tmp
  cd source.tmp
  git checkout v0.5.12
  cd ..
}

build() {
  ./autogen.sh
  ./configure
  make -j$(nproc)
}

copy() {
  cp source.tmp/src/dash rootfs/bin/dash
  ln -sf /bin/dash rootfs/bin/sh
}