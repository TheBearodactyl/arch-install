mkdir -p /home/thebearodactyluwu/'junk drawer'
cd /home/thebearodactyluwu/'junk drawer'
git clone https://github.com/Battlesquid/dotfiles
cd dotfiles
git checkout umi
./install.sh
sudo mv ~/.config/fonts/Material_Symbols_Rounded_Filled_20pt_Bold.ttf ~/.local/share/fonts/
sudo mv /home/thebearodactyluwu/.config/fonts/Material_Symbols_Rounded_Filled_20pt_Bold.ttf /home/thebearodactyluwu/.local/share/fonts/
fc-cache -f
cd ../
git clone https://github.com/Axarva/dotfiles-2.0
cd dotfiles-2.0
git checkout modified
chmod +x install-on-arch.sh
./install-on-arch.sh
paru -Sy awesome-git picom-git wezterm rofi acpi acpid acpi_call upower lxappearance-gtk3 jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim mpv mpd mpc mpdris2 python-mutagen ncmpcpp playerctl --needed
sudo systemctl enable mpd.service
sudo systemctl start mpd.service
git clone --depth 1 --recurse-submodules https://github.com/rxyhn/yoru.git
cd yoru && git submodule update --remote --merge
sudo mkdir ~/.config
sudo cp -r config/* ~/.config/
sudo cp -r config/* /home/thebearodactyluwu/.config/
