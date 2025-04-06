cd ${HOME}

# update arch
sudo pacman -Syu --noconfirm

# install/config git
sudo pacman -S git --noconfirm

# add dotfiles
git clone https://github.com/jpatrick5402/dotfiles.git
mkdir .config/

# install basic apps
sudo pacman -S less --noconfirm
sudo pacman -S copyq --noconfirm
sudo pacman -S bluez pulseaudio pulseaudio-bluetooth pulseaudio-jack --noconfirm
sudo pacman -S man --noconfirm
sudo pacman -S firefox --noconfirm

# install font
sudo pacman -S ttf-firacode-nerd --noconfirm

# install fzf
sudo pacman -S fzf --noconfirm

# install print drivers
#cd
#git clone https://aur.archlinux.org/cnijfilter2.git
#cd cnijfilter2/
#makepkg -si --noconfirm

# install i3 resources
sudo pacman -S polybar picom --noconfirm

# create symlinks for dotfiles
DIR=${HOME}/.dotfiles/nix_configs
DOTFILES=(
 ".Xresources"
 ".gitconfig"
 ".bashrc"
 ".config/polybar/config.ini"
 ".config/i3/config"
 ".config/picom/picom.conf"
)
mkdir ~/.config/
mkdir ~/.config/polybar/
mkdir ~/.config/i3/
mkdir ~/.config/picom/
for dotfile in "${DOTFILES[@]}"; do
	rm -rf "${HOME}/${dotfile}"
	ln -f "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
