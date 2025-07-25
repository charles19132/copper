#!/bin/bash
set -euxo pipefail

[[ -v FLAGS ]] && (
  export CFLAGS=$FLAGS
  export CXXFLAGS=$FLAGS
) || true

test -d rootfs && rm -rf rootfs

for component in components/*.sh; do
  bash build-component.sh "$component"
done
