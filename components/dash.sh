#!/bin/bash
set -euxo pipefail

prepare() {
  git clone --depth=1 --single-branch --branch=master git://git.kernel.org/pub/scm/utils/dash/dash.git source.tmp
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