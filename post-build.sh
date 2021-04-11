#!/bin/bash -x

# mount
sudo mount -o loop,offset=2097152 image.img image

# change root pass to empty
sudo sed -i -e "s/^root:[^:]\+:/root::/" image/etc/shadow

# disable cloud-init to speed up boot process
sudo touch image/etc/cloud/cloud-init.disabled

# install EIP97 firmware
sudo mkdir -p image/lib/firmware/inside-secure/eip197b/
sudo wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/inside-secure/eip197_minifw/ifpp.bin -O image/lib/firmware/inside-secure/eip197b/ifpp.bin
sudo wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/inside-secure/eip197_minifw/ipue.bin -O image/lib/firmware/inside-secure/eip197b/ipue.bin

# umount
sudo umount image
