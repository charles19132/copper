#!/bin/bash
set -euxo pipefail

test -d rootfs && rm -rf rootfs

for component in components/*.sh; do
  bash build-component.sh "$component"
done
