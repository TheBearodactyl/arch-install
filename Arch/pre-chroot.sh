sgdisk -Z /dev/nvme0n1
sgdisk -Z /dev/mmcblk0
cfdisk /dev/nvme0n1
cfdisk /dev/mmcblk0
mkfs.vfat -F32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
mkfs.ext4 /dev/mmcblk0p1
iwctl station wlan0 connect "Bane of Gannon's Existance Guest"
sleep 5
pacman -Syy
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
mount /dev/mmcblk0p1 /mnt
mkdir -p /mnt/{home,boot/efi}
mount /dev/nvme0n1p1 /mnt/boot/efi
mount /dev/nvme0n1p3 /mnt/home
cp post-chroot.sh /mnt/post-chroot.sh
chmod +x /mnt/post-chroot.sh
pacstrap /mnt base linux linux-firmware vim nano fakeroot git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
