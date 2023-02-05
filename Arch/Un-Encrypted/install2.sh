# executes commands for post-chroot

nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo thebearodactyluwu > /etc/hostname
touch /etc/hosts
nano /etc/hosts
passwd
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id="BEHOLD, PERRY THE PLATYPUS! THE ARCH-INATOR 3000!!!" --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo
useradd -m thebearodactyluwu
passwd thebearodactyluwu
usermod -aG wheel,audio,video,storage thebearodactyluwu
EDITOR=nano visudo
pacman -S xorg networkmanager plasma
systemctl enable gdm NetworkManager
exit
