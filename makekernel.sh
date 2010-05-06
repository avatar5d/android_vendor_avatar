# this script assumes the ARM toolchain is in $PATH

export ARCH=arm
export CROSS_COMPILE=arm-eabi-

CWD=`pwd`
DST=$CWD/../../out/target/product/passion/distilled_kernel/

cd $CWD/../../kernel
make distclean
make mahimahi_defconfig
make

mkdir -p $DST
cp ./arch/arm/boot/zImage $DST
cp ./drivers/net/wireless/bcm4329/bcm4329.ko $DST

cd $CWD
