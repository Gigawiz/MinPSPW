#!/bin/sh

LIBNAME=OSlib

if [ ! -d $LIBNAME ]
then
	wget http://brunni.dev-fr.org/dl/psp/OSLib_210_src.rar
#	../../mingw/bin/unzip -q oslib.zip
fi

cp Doxyfile $LIBNAME/$LIBNAME
cd $LIBNAME/$LIBNAME
make lib

mkdir -p ../../target/psp/include/oslib ../../target/psp/lib ../../target/doc/$LIBNAME
cp libosl.a ../../target/psp/lib

cp audio.h ../../target/psp/include/oslib
cp bgm.h ../../target/psp/include/oslib
cp drawing.h ../../target/psp/include/oslib
cp keys.h ../../target/psp/include/oslib
cp map.h ../../target/psp/include/oslib
cp messagebox.h ../../target/psp/include/oslib
cp oslib.h ../../target/psp/include/oslib
cp text.h ../../target/psp/include/oslib
cp vfpu.h ../../target/psp/include/oslib
cp VirtualFile.h ../../target/psp/include/oslib
cp vram_mgr.h ../../target/psp/include/oslib

doxygen

cp -fR ../../target/doc/oslib/html/* ../../target/doc/oslib
rm -fR ../../target/doc/oslib/html
echo "Run the NSIS script now!"