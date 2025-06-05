#!/bin/bash
set -euxo pipefail
git clone --depth=1 --single-branch --branch=master git://git.suckless.org/sbase
cd sbase
echo sbase=$(git rev-parse HEAD) > .sbom-fragment
make -j$(nproc)
cd ..
find sbase -maxdepth 1 -type f -executable -exec cp {} rootfs/bin \;
cat sbase/.sbom-fragment >> rootfs/.sbom
rm -rf sbase
