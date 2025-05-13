#!/bin/bash
set -e

cd ${HOME}

# update arch
sudo pacman -Syu --noconfirm

# install basic apps
sudo pacman -S maim pipewire-pulse playerctl libreoffice-still zip unzip ripgrep rofi npm zsh arandr blueman polybar picom feh git alacritty neovim base-devel fzf ttf-3270-nerd ttf-firacode-nerd firefox man less bluez bluez-utils --noconfirm

# add dotfiles (in case they're not already loaded
set +e
git clone https://github.com/jpatrick5402/.dotfiles
set -e

# install AUR packages (Way faster than all at once)
# install yay first
if pacman -Qs yay > /dev/null; then
  echo "Yay is installed"
else
  cd && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si --noconfirm
  cd
fi
PACKAGES=(
  "zen-browser-bin"
  "visual-studio-code-bin"
  "clipmenu-rofi"
  )
for package in "${PACKAGES[@]}"; do
  if pacman -Qs ${package} > /dev/null; then
    echo "${package} already installed"
  else
    yay -S ${package} --noconfirm
  fi
done

# install printer drivers
#cd
#git clone https://aur.archlinux.org/cnijfilter2.git
#cd cnijfilter2/
#makepkg -si --noconfirm

# install sddm theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

# install oh my zsh
set +e
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
set -e

# adding zsh-suggestions
set +e
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
set -e

# create symlinks for dotfiles
cd ~/.dotfiles/nix_configs
find . -maxdepth 1 | while read file; do ln -s ~/.dotfiles/nix_configs/$file ~/; done

# nvim separate due to sym link needed
rm -rf ${HOME}/.config/nvim
ln -sf "${HOME}/.dotfiles/nvim/" "${HOME}/.config/nvim"
