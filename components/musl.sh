#!/bin/bash
git clone --depth=1 --single-branch --branch=master git://git.musl-libc.org/musl
cd musl
echo musl=$(git rev-parse HEAD) > .sbom-fragment
./configure
make -j$(nproc)
cd ..
cp musl/lib/libc.so rootfs/lib/ld-musl-$(uname -m).so.1
cat musl/.sbom-fragment >> rootfs/.sbom
rm -rf musl
