nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo thebearodactyluwu > /etc/hostname
touch /etc/hosts
nano /etc/hosts
passwd
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id="BEHOLD PERRY THE PLATYPUS!!! THE ARCH-INATOR 300!!!!!!!!" --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo
useradd -m thebearodactyluwu
passwd thebearodactyluwu
usermod -aG wheel,audio,video,storage thebearodactyluwu
EDITOR=nano visudo
nano /etc/pacman.conf
pacman -S xorg networkmanager gnome plasma plasma-wayland-session git fakeroot chromium
systemctl enable gdm NetworkManager
cp post-install.sh /home/thebearodactyluwu/post-install.sh
exit
