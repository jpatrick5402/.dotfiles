cd ${HOME}

# update arch
sudo pacman -Syu --noconfirm

# install basic apps
sudo pacman -S npm zsh arandr blueman polybar picom feh git alacritty neovim base-devel fzf ttf-3270-nerd ttf-firacode-nerd firefox man clipmenu less bluez bluez-utils pulseaudio pulseaudio-bluetooth pulseaudio-jack --noconfirm

# adding zsh-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# add dotfiles (in case they're not already loaded
git clone https://github.com/jpatrick5402/.dotfiles

# install AUR packages (Way faster than all at once)
# install yay first
if pacman -Qs yay > /dev/null; then
  echo "Yay is installed"
else
  cd && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si --noconfirm
fi
PACKAGES=(
  "zen-browser-bin"
  "visual-studio-code-bin"
  )
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

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
 ".zshrc"
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
ln -sf "${HOME}/.dotfiles/nvim/" "${HOME}/.config/nvim"
