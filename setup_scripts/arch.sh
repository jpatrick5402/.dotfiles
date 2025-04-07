cd ${HOME}

# update arch
sudo pacman -Syu --noconfirm

# install basic apps
sudo pacman -S polybar picom feh git alacritty neovim base-devel fzf ttf-firacode-nerd firefox man clipmenu less bluez bluez-utils pulseaudio pulseaudio-bluetooth pulseaudio-jack --noconfirm

# add dotfiles (in case they're not already loaded
git clone https://github.com/jpatrick5402/.dotfiles

# install AUR packages
# install yay first
if pacman -Qs yay > /dev/null; then
  echo "Yay is installed"
else
  cd && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si
fi
PACKAGES=()
for package in "${PACKAGES[@]}"; do
  if pacman -Qs ${package} > /dev/null; then
    echo "${package} already installed"
  else
    yay -S ${package} --noconfirm
  fi
done

# install print drivers
#cd
#git clone https://aur.archlinux.org/cnijfilter2.git
#cd cnijfilter2/
#makepkg -si --noconfirm

# create symlinks for dotfiles
DIR=${HOME}/.dotfiles/nix_configs
DOTFILES=(
 ".Xresources"
 ".gitconfig"
 ".bashrc"
 ".config/polybar/config.ini"
 ".config/i3/config"
 ".config/picom.conf"
 ".config/alacritty/alacritty.toml"
)
mkdir ~/.config/
mkdir ~/.config/polybar/
mkdir ~/.config/i3/
mkdir ~/.config/alacritty/
for dotfile in "${DOTFILES[@]}"; do
	rm -rf "${HOME}/${dotfile}"
	ln -f "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
# nvim separate due to sym link needed
rm -rf ${HOME}/.config/nvim
ln -sf "${HOME}/.dotfiles/nvim/" "${HOME}/.config/"
