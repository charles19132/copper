#!/bin/bash
set -euxo pipefail

FLAGS=""
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS

test -d rootfs && rm -rf rootfs
mkdir -p rootfs/{bin,lib}

for component in components/*.sh; do
  bash build-component.sh $component
done