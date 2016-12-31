#!/bin/bash
DEFCONFIG=DarkSense_defconfig
make clean && make mrproper
export CROSS_COMPILE=~/android/aarch64-linux-android-7.x/bin/aarch64-linux-android-
export ARCH=arm64
make -j8 $DEFCONFIG
cp .config $DEFCONFIG
