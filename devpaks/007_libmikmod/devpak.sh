#!/bin/bash
set -e
. ../util/util.sh

LIBNAME=libmikmod
VERSION=3.1.11

download build "http://mikmod.raphnet.net/files" $LIBNAME-$VERSION "tar.gz"

cd build/$LIBNAME-$VERSION
make -f Makefile.psp

mkdir -p ../target/psp/include ../target/psp/lib ../target/doc
cp include/mikmod_build.h ../target/psp/include/mikmod.h
cp libmikmod/libmikmod.a ../target/psp/lib
cp docs/mikmod.html ../target/doc
cd ../..

makeInstaller $LIBNAME $VERSION

echo "Done!"

