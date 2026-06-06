# GNU Make on Plan 9 APE

These helpers are for building this GNU Make fork on 9front using APE.

From the repository root, enter APE and run:

```sh
ape/psh
build-aux/plan9/configure.sh --prefix=/usr/glenda/lib/unix/make-4.4.1
build-aux/plan9/build.sh
build-aux/plan9/install.sh
```

The helper scripts set a conservative PATH:

```sh
$PWD/build-aux/plan9/shims/bin:/bin
```

This avoids accidentally using an already-installed GNU Make during configure or
bootstrap builds. The configure helper also sets `CC=c89` and adds
`-D_RESEARCH_SOURCE`.

`install.sh` refreshes generated-file timestamps before invoking `./make
install`. This prevents the generated Makefiles from trying to run unavailable
Autotools or Texinfo programs such as `aclocal-1.16` or `makeinfo`.
