#!/bin/bash
. ../util/util.sh

LIBNAME=sqlite
VERSION=3.3.17

svnGetPS2DEV $LIBNAME

cd $LIBNAME
export PSPDEV=$(psp-config --pspdev-path)
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./configure --host=psp --disable-readline --disable-tcl --prefix=$(pwd)/../target/psp

make || { echo "Error building $LIBNAME"; exit 1; }

make install || { echo "Error installing $LIBNAME"; exit 1; }
rm -fR ../target/psp/lib/pkgconfig

cd ..

makeInstaller $LIBNAME $VERSION

unset PSPDEV
echo "Done!"

