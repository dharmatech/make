#!/bin/ape/sh
set -e

PATH="$PWD/build-aux/plan9/shims/bin:/bin"
export PATH

: ${CC:=c89}
export CC

case " $CPPFLAGS " in
  *" -D_RESEARCH_SOURCE "*) ;;
  *) CPPFLAGS="-D_RESEARCH_SOURCE $CPPFLAGS" ;;
esac
export CPPFLAGS

has_prefix=false
for arg in "$@"; do
  case "$arg" in
    --prefix|--prefix=*) has_prefix=true ;;
  esac
done

if $has_prefix; then
  exec ./configure --disable-nls --disable-largefile --disable-dependency-tracking "$@"
else
  exec ./configure --prefix=/usr/glenda/lib/unix/make-4.4.1 --disable-nls --disable-largefile --disable-dependency-tracking "$@"
fi
