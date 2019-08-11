#!/bin/bash

echo "Enter the name of the kernel: "
read kernel

cp -v arch/x86_64/boot/bzImage /boot/vmlinux-$kernel
touch /etc/mkinitcpio.d/$kernel.preset
echo "#mkinitcpio preset file for the 'linux' package

ALL_config="/etc/mkinitcpio.conf"
"
