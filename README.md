# List serial ports for Java

Native library for java

Available methods:
* String resolveDeviceAttachedToNative(String port)
* String[] listSerialsNative()

Package structure:
java/base/platforms/Platform.java
Сan change to jnilib.c

Prerequisites:
* An [osxcross](https://github.com/tpoechtrager/osxcross) installation
* Setup osxcross + add binaries to PATH
* An updated mingw32 environment

sudo apt-get install build-essential gcc-multilib g++-multilib mingw-w64 xz-utils libxml2-dev linux-libc-dev:i386 clang patch git autoconf libtool

## 2020 Roman
