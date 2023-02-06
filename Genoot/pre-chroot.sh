sgdisk -Z /dev/nvme0n1
sgdisk -Z /dev/mmcblk0
cfdisk /dev/nvme0n1
cfdisk /dev/mmcblk0
cryptsetup -v --cipher aes-xts-plain64 --key-size 256 -y luksFormat /dev/mmcblk0p1
cryptsetup -v --cipher aes-xts-plain64 --key-size 256 -y luksFormat /dev/nvme0n1p3
cryptsetup open --type luks /dev/mmcblk0p1 bea-root-dactyl
cryptsetup open --type luks /dev/nvme0n1p3 bearodactyl-den
pvcreate /dev/mapper/bea-root-dactyl
vgcreate vg0 /dev/mapper/bea-root-dactyl
pvcreate /dev/mapper/bearodactyl-den
vgcreate vg1 /dev/mapper/bearodactyl-den
lvcreate -l +100%FREE vg0 --name root
lvcreate -l +100%FREE vg1 --name home
mkfs.vfat -F32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mkfs.ext4 /dev/mapper/vg0-root
mkfs.ext4 /dev/mapper/vg1-home
mkdir -p /mnt/gentoo
mount /dev/mapper/vg0-root /mnt/gentoo
mkdir -p /mnt/gentoo/boot
mount /dev/nvme0n1p1 /mnt/gentoo/boot
mkdir /mnt/gentoo/home
mount /dev/mapper/vg1-home /mnt/gentoo/home
tzselect
ntpdate pool.ntp.org
curl -o /mnt/gentoo/gentoo.tar.xz -L https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20230129T164658Z/stage3-amd64-desktop-systemd-20230129T164658Z.tar.xz
cd /mnt/gentoo
tar -xf gentoo.tar.xz --xattrs
gcc -c -Q -march=native --help=target | awk '/^  -march=/ {print $2}'
echo 'Remember this!'
sleep 10
nano -w /mnt/gentoo/etc/portage/make.conf
lscpu | awk '/^CPU\(s\):/ {print $2}'
echo 'Remember this too!'
nano /mnt/gentoo/etc/portage/make.conf
mirrorselect -D -s4 -o >> /mnt/gentoo/etc/portage/make.conf
mkdir -p /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
chroot /mnt/gentoo /bin/bash
