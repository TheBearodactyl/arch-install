#!/bin/bash

cd /root
cp configs/locale.gen /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo thebearodactyluwu > /etc/hostname
cp configs/hosts /etc/hosts
(echo 'WaiEloDer1!'; echo 'WaiEloDer1!') | passwd
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id="THE ARCH-INATOR 3000" --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo
useradd -m thebearodactyluwu
(echo 'WaiEloDer1!'; echo 'WaiEloDer1!') | passwd thebearodactyluwu
usermod -aG wheel,audio,video,storage thebearodactyluwu
EDITOR=vim visudo
pacman -S xorg networkmanager plasma plasma-wayland-session kitty chromium dolphin git
systemctl enable gdm NetworkManager
