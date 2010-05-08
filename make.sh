for i in $*
do
  case $i in
    --src=*)
      SRC=`echo $i | sed 's/.*=//'`
      ;;
    --dst=*)
      DST=`echo $i | sed 's/.*=//'`
      ;;
    --no-kernel)
      NOKERNEL=1
  esac
done

if [[ -z "$SRC" ]]; then
  echo "usage: make --src=/path/to/distilled/ [--dst=/path/to/update.zip/] [--no-kernel]"
  exit 0
fi

if [[ ! -d $SRC ]]; then
  echo "Invalid source directory specified"
  exit
fi

if [[ $DST ]]; then
  if [[ ! -d $DST ]]; then
    echo "Invalid destination directory specified"
    exit
  fi
fi

SUROOT=$SRC/system/extras/su
VENDOR=$SRC/vendor/avatar

# prefer the su created by the Superuser app
if [ -f $SUROOT/Android.mk ]; then
  mv $SUROOT/Android.mk $SUROOT/Android.mk.dead
fi

$VENDOR/scripts/makeplatform.sh $SRC

if [[ -z $NOKERNEL ]]; then
  $VENDOR/scripts/makekernel.sh $SRC
fi

# create update.zip
if [ $DST ]; then
  $VENDOR/scripts/collectandsign.sh $SRC $DST
fi
