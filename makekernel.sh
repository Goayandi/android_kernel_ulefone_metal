#!/bin/bash
DEFCONFIG=lineage_metal_defconfig
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
make clean && make mrproper
export CROSS_COMPILE=~/android/android-ndk-r13b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-
export ARCH=arm64
make -j8 $DEFCONFIG
make -j8
cp arch/arm64/boot/Image.gz-dtb $KERNEL
