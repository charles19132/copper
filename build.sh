#!/bin/bash
FLAGS="-s -Os -Wl,--gc-sections"
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
rm -rf rootfs
mkdir -p rootfs/{bin,lib}
source components/musl.sh
source components/dash.sh
source components/sbase.sh
