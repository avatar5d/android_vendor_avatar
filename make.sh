if [ -z "$1" ]; then
  echo "usage: make <distilled-src-root> [dst-update.zip-dir]"
  exit 0
fi

ROOT=$1
OUT=$2
SUROOT=$ROOT/system/extras/su
VENDOR=$ROOT/vendor/avatar

# prefer the su created by the Superuser app
if [ -f $SUROOT/Android.mk ]; then
  mv $SUROOT/Android.mk $SUROOT/Android.mk.dead
fi

# build the bits
$VENDOR/scripts/makeplatform.sh $ROOT
$VENDOR/scripts/makekernel.sh $ROOT

# create update.zip
if [ $OUT ]; then
  $VENDOR/scripts/collectandsign.sh $ROOT $OUT
fi
