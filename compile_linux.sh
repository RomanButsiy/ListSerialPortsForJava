#!/bin/bash -xe

JAVA_INCLUDE_PATH=/usr/lib/jvm/default-java/include/

mkdir -p distrib/linux64
cd libserialport
./autogen.sh
./configure
make clean
make
cd ..
gcc main.c libserialport/linux_termios.c libserialport/linux.c libserialport/serialport.c -Ilibserialport/  -o listSerialC
cp listSerialC distrib/linux64/listSerialC
gcc jnilib.c libserialport/linux_termios.c libserialport/linux.c libserialport/serialport.c -Ilibserialport/ -I$JAVA_INCLUDE_PATH -I$JAVA_INCLUDE_PATH/linux/ -shared -fPIC -o liblistSerialsj_x64.so
cp liblistSerialsj_x64.so distrib/linux64/

mkdir -p distrib/linux32
cd libserialport
./autogen.sh
CFLAGS=-m32 ./configure
make clean
make
cd ..
gcc -m32 main.c libserialport/linux_termios.c libserialport/linux.c libserialport/serialport.c -Ilibserialport/ -o listSerialC
cp listSerialC distrib/linux32/listSerialC
gcc -m32 jnilib.c libserialport/linux_termios.c libserialport/linux.c libserialport/serialport.c -Ilibserialport/ -I$JAVA_INCLUDE_PATH -I$JAVA_INCLUDE_PATH/linux/ -shared -fPIC -o liblistSerialsj.so
cp liblistSerialsj.so distrib/linux32
