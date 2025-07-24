#!/bin/bash
set -euxo pipefail

. "$1"

test -d source.tmp && rm -rf source.tmp || true

prepare

cd source.tmp
build
cd ..

copy

rm -rf source.tmp