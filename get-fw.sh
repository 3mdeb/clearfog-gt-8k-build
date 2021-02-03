#!/bin/bash

ROOT="$1"

if [ -z "$ROOT" ]; then
  echo "provide ROOT as 1st arg"
  echo "Example: ${0} /mnt # if target rootfs is mounted at /mnt"
  exit 1
fi

mkdir -p $ROOT/lib/firmware/
cd $ROOT/lib/firmware/inside-secure/eip197b/
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/inside-secure/eip197_minifw/ifpp.bin
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/inside-secure/eip197_minifw/ipue.bin
sync
cd -
