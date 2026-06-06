# GNU Make 4.4.1 for Plan 9

This branch contains a Plan 9/9front APE port of GNU Make 4.4.1.

The Plan 9-specific build helpers live in `build-aux/plan9`.

## Build and Install

From Plan 9:

```sh
cd /usr/glenda/src
git/clone git@github.com:dharmatech/make.git
cd make
git/branch plan9-4.4.1-000

ape/psh
build-aux/plan9/configure.sh --prefix=/usr/glenda/lib/unix/make-4.4.1
build-aux/plan9/build.sh
build-aux/plan9/install.sh
```

The install prefix can be changed. The path above keeps this build separate
from the rest of the system until you choose how to bind or expose it.

## Smoke Test

```sh
/usr/glenda/lib/unix/make-4.4.1/bin/make --version
```
