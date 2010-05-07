#!/bin/bash

if [[ -z "$1"  || -z "$2" ]]; then
  echo "usage: collectandsign.sh <distilled-src-root> <out-dir>"
  exit 0
fi

SRC=$1
DST=$2
VERSION=distilled.130

# .-.-.-.-.-.-.-.- 

STAGE=$DST/$VERSION-tmp
PRODUCT=$SRC/out/target/product/passion
OUTUNSIGNED=$DST/$VERSION.zip
OUTSIGNED=$DST/$VERSION-signed.zip
SIGNAPK=$SRC/out/host/linux-x86/framework/signapk.jar 
TESTCERT=$SRC/build/target/product/security/testkey.x509.pem
TESTKEY=$SRC/build/target/product/security/testkey.pk8

# remove old stuff
rm -rf $STAGE 2> /dev/null
mkdir -p $STAGE

# stage script
mkdir -p $STAGE/META-INF/com/google/android/
cp $SRC/vendor/avatar/update-script $STAGE/META-INF/com/google/android/

# create boot.img
mkbootimg --base 0x20000000 --cmdline 'no_console_suspend=1 console=null' --kernel $PRODUCT/distilled_kernel/zImage --ramdisk $PRODUCT/ramdisk.img --output $STAGE/boot.img

# prepare system
mkdir -p $STAGE/system/
cp $PRODUCT/distilled_kernel/bcm4329.ko $PRODUCT/system/lib/modules/
cp -rfp $PRODUCT/system/* $STAGE/system/
find $PRODUCT/system/bin -name "*" -type l -print0 | xargs -0 rm {}; 2> /dev/null
rm $PRODUCT/system/bin/su 

# clean old signed, unsigned zips
rm $OUTSIGNED 2> /dev/null

# zip, sign, verify
pushd $STAGE
zip -r $OUTUNSIGNED .
popd

java -jar $SIGNAPK $TESTCERT $TESTKEY $OUTUNSIGNED $OUTSIGNED
jarsigner -verify -verbose -certs $OUTSIGNED

# clean up
rm $OUTUNSIGNED 2> /dev/null
rm -rf $STAGE 2> /dev/null
