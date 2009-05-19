#!/bin/bash
. ../util/util.sh

LIBNAME=libcurl
VERSION=7.15.1

svnGetPSPWARE $LIBNAME

cd $LIBNAME

LDFLAGS="-L$(psp-config --psp-prefix)/lib -L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspnet_inet -lpspnet_resolver -lpspuser" ./configure --host=psp --disable-shared --prefix=$(pwd)/../target/psp

make CFLAGS=-G0 || { echo "Error building $LIBNAME"; exit 1; }

make install || { echo "Error installing $LIBNAME"; exit 1; }

cd ..

mkdir -p target/bin
rm -fR target/psp/bin
gcc -s -o target/bin/curl-config curl-config.c || { echo "Error building curl-config"; exit 1; }

makeInstaller $LIBNAME $VERSION

rm target/bin/curl-config
i586-mingw32msvc-gcc -s -o target/bin/curl-config.exe || { echo "Error building curl-config"; exit 1; }

makeNSISInstaller $LIBNAME

echo "Done!"
