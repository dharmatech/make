#!/bin/ape/sh
set -e

PATH="$PWD/build-aux/plan9/shims/bin:/bin"
export PATH

# Keep release-generated files newer than their Autotools/Texinfo inputs. A
# fresh git checkout gives many files very similar timestamps, which can make
# GNU Make try to run aclocal, autoconf, autoheader, automake, or makeinfo.
for f in aclocal.m4 configure Makefile.in src/config.h.in; do
  test -f "$f" && touch "$f"
done

for f in config.status Makefile build.cfg tests/config-flags.pm \
         lib/Makefile doc/Makefile po/Makefile.in po/Makefile \
         src/stamp-h1; do
  test -f "$f" && touch "$f"
done

for f in doc/stamp-vti doc/version.texi; do
  test -f "$f" && touch "$f"
done

for f in doc/make.info doc/make.info-1 doc/make.info-2 doc/make.info-3; do
  test -f "$f" && touch "$f"
done

exec ./make install "$@"
