#!/bin/sh
. ../util/util.sh

LIBNAME=libmikmod
VERSION=3.1.11

svnGetPS2DEV $LIBNAME

cd $LIBNAME
make -f Makefile.psp || { echo "Error building $LIBNAME"; exit 1; }

mkdir -p ../target/psp/include ../target/psp/lib ../target/doc
cp include/mikmod_build.h ../target/psp/include/mikmod.h
cp libmikmod/libmikmod.a ../target/psp/lib
cp docs/mikmod.html ../target/doc
cd ..

makeInstaller $LIBNAME $VERSION

echo "Run the NSIS script now!"
