#!/bin/bash
set -euxo pipefail
FLAGS="-s -Os -ffunction-sections -fdata-sections -Wl,--gc-sections"
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
test -d rootfs && rm -rf rootfs
mkdir -p rootfs/{bin,lib}
. components/musl.sh
. components/dash.sh
. components/sbase.sh
