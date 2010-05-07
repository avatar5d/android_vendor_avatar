if [ -z "$1" ]; then
  echo "usage: makeplatform.sh <distilled-src-root>"
  exit 0
fi

ROOT=$1

pushd $ROOT
. build/envsetup.sh
lunch
make -j4
popd
