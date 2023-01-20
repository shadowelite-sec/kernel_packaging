#!/bin/bash

set -e

if [ ! $# -eq 2 ]; then
echo "Usage: $0 <path to kernel binary> <zip name>"
exit 1
fi
KERNELBIN=$1
ZIPNAME=$2
if [ ! -f "$KERNELBIN" ]; then
echo "$KERNELBIN is either not a file or doesn't exist"
exit 1
fi
rm -f AnyKernel3/Image
cp -f "$KERNELBIN" AnyKernel3/Image
cd AnyKernel3
zip -r9 kernel.zip META-INF anykernel.sh Image tools version
mv -f kernel.zip ../"$ZIPNAME"
cd ..
