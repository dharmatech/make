#!/bin/ape/sh
set -e

PATH="$PWD/build-aux/plan9/shims/bin:/bin"
export PATH

exec ./build.sh "$@"
