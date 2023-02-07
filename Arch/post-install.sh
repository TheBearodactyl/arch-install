sudo -s
pacman -Syu
pacman -S virtualbox
touch /etc/modules-load.d/virtualbox.conf
echo vboxdrv > /etc/modules-load.d/virtualbox.conf
