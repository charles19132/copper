#!/bin/bash
git clone --depth=1 --single-branch --branch=master git://git.kernel.org/pub/scm/utils/dash/dash.git
cd dash
echo dash=$(git rev-parse HEAD) > .sbom-fragment
./autogen.sh
./configure
make -j$(nproc)
cd ..
cp dash/src/dash rootfs/bin/dash
ln -s /bin/dash rootfs/bin/sh
cat dash/.sbom-fragment >> rootfs/.sbom
rm -rf dash
