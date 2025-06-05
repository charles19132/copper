#!/bin/bash
set -euxo pipefail
FLAGS="-s -Os -ffunction-sections -fdata-sections -Wl,--gc-sections"
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
rm -rf rootfs || true
mkdir -p rootfs/{bin,lib}
. components/musl.sh
. components/dash.sh
. components/sbase.sh
