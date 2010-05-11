#!/bin/bash

# check params, paths
if [[ -z "$1"  || -z "$2" ]]; then
  echo "usage: collectandsign.sh <distilled-src-root> <out-dir>"
  exit 0
fi

SRC=$1
DST=$2

# massage the version out of the product description file
VERSION=`cat $SRC/vendor/avatar/products/avatar_passion.mk | grep 'ro.modversion' | sed 's/ro.modversion=//' | tr -d '[:blank:]'`

if [[ -z $VERSION ]]; then
  VERSION="distilled-unkver"
fi

# important paths
STAGE=$DST/$VERSION-tmp
PRODUCT=$SRC/out/target/product/passion
OUTUNSIGNED=$DST/$VERSION.zip
OUTSIGNED=$DST/$VERSION-signed.zip
SIGNAPK=$SRC/out/host/linux-x86/framework/signapk.jar 
TESTCERT=$SRC/build/target/product/security/testkey.x509.pem
TESTKEY=$SRC/build/target/product/security/testkey.pk8

# remove old stage, if exists 
rm -rf $STAGE 2> /dev/null
mkdir -p $STAGE
rm $OUTSIGNED 2> /dev/null

# copy update script 
mkdir -p $STAGE/META-INF/com/google/android/
cp $SRC/vendor/avatar/update-script $STAGE/META-INF/com/google/android/

# create and copy boot.img (kernel + ramdisk).
mkbootimg --base 0x20000000 \
          --cmdline 'no_console_suspend=1 console=null' \
          --kernel $PRODUCT/distilled_kernel/zImage \
          --ramdisk $PRODUCT/ramdisk.img \
          --output $STAGE/boot.img

# create and copy system.img (frameworks,apps)
mkdir -p $STAGE/system/
cp $PRODUCT/distilled_kernel/bcm4329.ko $PRODUCT/system/lib/modules/
find $PRODUCT/system/bin -name "*" -type l -print0 | xargs -0 rm {}; 2> /dev/null
rm $PRODUCT/system/bin/su 
cp -rfp $PRODUCT/system/* $STAGE/system/

# zip, sign, verify
pushd $STAGE
zip -r $OUTUNSIGNED .
popd

java -jar $SIGNAPK $TESTCERT $TESTKEY $OUTUNSIGNED $OUTSIGNED
jarsigner -verify -verbose -certs $OUTSIGNED

# clean
rm $OUTUNSIGNED 2> /dev/null
rm -rf $STAGE 2> /dev/null
