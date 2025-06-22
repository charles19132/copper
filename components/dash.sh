#!/bin/bash
set -euxo pipefail
git clone --depth=1 --single-branch --branch=master git://git.kernel.org/pub/scm/utils/dash/dash.git
cd dash
./autogen.sh
./configure
make -j$(nproc)
cd ..
cp dash/src/dash rootfs/bin/dash
ln -s /bin/dash rootfs/bin/sh
rm -rf dash
