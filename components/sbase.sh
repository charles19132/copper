#!/bin/bash
git clone --depth=1 --single-branch --branch=master git://git.suckless.org/sbase
cd sbase
make -j$(nproc)
cd ..
find sbase -maxdepth 1 -type f -executable -exec cp {} rootfs/bin \;
rm -rf sbase
