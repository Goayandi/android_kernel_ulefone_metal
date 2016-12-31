#!/bin/bash
DEFCONFIG=DarkSense_defconfig
KERNEL=DarkSense
TOOLSDIR=tools/tools
if [  -f $KERNEL ]; then
	rm $KERNEL
fi
if [  -f $DEFCONFIG ]; then
	rm $DEFCONFIG
fi
if [ ! -d "$TOOLSDIR" ]; then
  mkdir $TOOLSDIR
fi
#make clean && make mrproper
export CROSS_COMPILE=~/android/aarch64-linux-android-7.x/bin/aarch64-linux-android-
export ARCH=arm64
make -j8 $DEFCONFIG
make -j8
cp arch/arm64/boot/Image.gz-dtb $KERNEL
