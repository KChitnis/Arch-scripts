#!/bin/bash

#WARNING
tput setaf 1; echo RUN THIS ONLY AFTER RUNNING make '&' make modules_install ! 

#GETTING KERNEL NAME
echo "Enter the name of the kernel: "
read kernel

#COPING VMLINUX
cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-$kernel

#CREATING PRESET
touch /etc/mkinitcpio.d/$kernel.preset
echo "# mkinitcpio preset file for the '"'linux'"' package" >> /etc/mkinitcpio.d/$kernel.preset
echo ALL_config='"'/etc/mkinitcpio.conf'"' >> /etc/mkinitcpio.d/$kernel.preset
echo ALL_kver='"'/boot/vmlinuz-$kernel'"' >> /etc/mkinitcpio.d/$kernel.preset
echo "PRESETS=('"'default'"' '"'fallback'"')" >> /etc/mkinitcpio.d/$kernel.preset
echo '#'default_config='"'/etc/mkinitcpio.conf'"' >> /etc/mkinitcpio.d/$kernel.preset
echo default_image='"'/boot/initramfs-$kernel.img'"' >> /etc/mkinitcpio.d/$kernel.preset
echo '#'default_options='"''"' >> /etc/mkinitcpio.d/$kernel.preset
echo '#'fallback_config='"'/etc/mkinitcpio.conf'"' >> /etc/mkinitcpio.d/$kernel.preset
echo fallback_image='"'/boot/initramfs-$kernel-fallback.img'"' >> /etc/mkinitcpio.d/$kernel.preset
echo fallback_options='"'-S autodetect'"' >> /etc/mkinitcpio.d/$kernel.preset

#GENERATING INITIAL RAM DISK
mkinitcpio -p $kernel

#COPING SYSTEM MAP
cp System.map /boot/System.map-$kernel
ln -sf /boot/System.map-$kernel /boot/System.map

#CONFIGUREING BOOTLOADER
grub-mkconfig -o /boot/grub/grub.cfg
