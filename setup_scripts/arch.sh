cd ${HOME}

# update arch
sudo pacman -Syu --noconfirm

# install/config git
sudo pacman -S git --noconfirm

# add dotfiles (in case they're not already loaded
git clone https://github.com/jpatrick5402/.dotfiles

# install basic apps
sudo pacman -S fzf ttf-firacode-nerd firefox man clipmenu less bluez bluez-utils pulseaudio pulseaudio-bluetooth pulseaudio-jack --noconfirm

# install print drivers
#cd
#git clone https://aur.archlinux.org/cnijfilter2.git
#cd cnijfilter2/
#makepkg -si --noconfirm

# install i3 resources
sudo pacman -S polybar picom feh --noconfirm

# create symlinks for dotfiles
DIR=${HOME}/.dotfiles/nix_configs
DOTFILES=(
 ".Xresources"
 ".gitconfig"
 ".bashrc"
 ".config/polybar/config.ini"
 ".config/i3/config"
 ".config/picom.conf"
)
mkdir ~/.config/
mkdir ~/.config/polybar/
mkdir ~/.config/i3/
for dotfile in "${DOTFILES[@]}"; do
	rm -rf "${HOME}/${dotfile}"
	ln -f "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
