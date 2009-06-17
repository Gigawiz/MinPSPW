#!/bin/bash
. ../util/util.sh

LIBNAME=intraFont
PKG=$LIBNAME\_0.31
VERSION=0.31

downloadHTTP http://www.psp-programming.com/benhur $PKG.zip

if [ ! -d $LIBNAME ]
then
	mkdir $LIBNAME
	cd $LIBNAME
	if [ "$OS" == "MINGW32_NT-5.1" ]; then
		../../mingw/bin/unzip -q ../$PKG.zip
	else
		unzip -q ../$PKG.zip
	fi
	cd ..
	patch -p1 -d $LIBNAME -i ../../$LIBNAME.patch || { echo "Error patching $LIBNAME"; exit; }
fi

cd $LIBNAME

make || { echo "Error building $LIBNAME"; exit 1; }

make install || { echo "Error building $LIBNAME"; exit 1; }

cd ..

makeInstaller $LIBNAME $VERSION
cp build/intraFont-0.31.tar.bz2 build/intrafont-0.31.tar.bz2

echo "Done!"

