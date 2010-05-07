if [ -z "$1" ]; then
  echo "usage: makekernel.sh <distilled-src-root>"
  exit 0
fi

# this script assumes the ARM toolchain is in $PATH

export ARCH=arm
export CROSS_COMPILE=arm-eabi-

ROOT=$1
DST=$ROOT/out/target/product/passion/distilled_kernel/

pushd $ROOT/kernel
make distclean
make mahimahi_defconfig
make
mkdir -p $DST
cp ./arch/arm/boot/zImage $DST
cp ./drivers/net/wireless/bcm4329/bcm4329.ko $DST
popd
