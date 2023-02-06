emerge -aq ufed
echo "DON'T FORGET TO ENABLE CRYPTSETUP, LVM, AND LVM2CREATE-INITRD, OTHERWISE YOUR SYSTEM WONT WORK"
sleep 10
ufed
nano -w /etc/portage/make.conf
emerge -aq app-portage/cpuid2cpuflags
cpuid2cpuflags
echo "COPY THESE AND PASTE THEM, REPLACING THE : WITH = AND PUTTING QUOTES AT THE BEGGINING AND END OF THE LIST"
sleep 10
nano /etc/portage/make.conf
emerge -aquDN @world
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
nano -w /etc/locale.gen
locale-gen
eselect locale list
