source /etc/profile
export PS1="(chroot) $PS1"
emerge-webrsync
emerge --sync
eselect profile list
