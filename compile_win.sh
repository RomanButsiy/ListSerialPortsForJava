#!/bin/bash -xe

JAVA_INCLUDE_PATH=/usr/lib/jvm/default-java/include/

mkdir -p distrib/windows64
cd libserialport
./autogen.sh
./configure --host=x86_64-w64-mingw32
make clean
make
cd ..
x86_64-w64-mingw32-gcc main.c -Llibserialport/.libs/ -Ilibserialport/ -lserialport -lsetupapi -static -o listSerialC.exe
cp listSerialC.exe distrib/windows64/
x86_64-w64-mingw32-gcc -m64 -D_JNI_IMPLEMENTATION_ -Wl,--kill-at jnilib.c libserialport/.libs/libserialport.a -lsetupapi -Ilibserialport/ -I$JAVA_INCLUDE_PATH -Iwin32_jni -shared -o listSerialsj_x64.dll
cp listSerialsj_x64.dll distrib/windows64/

mkdir -p distrib/windows32
cd libserialport
./autogen.sh
./configure --host=i686-w64-mingw32
make clean
make
cd ..
i686-w64-mingw32-gcc main.c -Llibserialport/.libs/ -Ilibserialport/ -lserialport -lsetupapi -static -o listSerialC.exe
cp listSerialC.exe distrib/windows32/
i686-w64-mingw32-gcc -D_JNI_IMPLEMENTATION_ -Wl,--kill-at jnilib.c libserialport/.libs/libserialport.a -lsetupapi -Ilibserialport/ -I$JAVA_INCLUDE_PATH -Iwin32_jni -shared -o listSerialsj.dll
cp listSerialsj.dll distrib/windows32/
