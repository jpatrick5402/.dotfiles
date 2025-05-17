#!/bin/bash
#update system
sudo pacman -Syu

#link nvim configs
ln -sf ~/.dotfiles/nvim/ ~/.config/

#install basic packages
sudo pacman -S btop zip unzip gcc ripgrep tree man numlockx neovim ttf-firacode-nerd base-devel --noconfirm

#install config-specific packages
sudo pacman -S dmenu zsh picom rofi --noconfirm

#install yay
if pacman -Qs yay > /dev/null; then echo "Yay is installed"
else
  cd && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si --noconfirm && cd
fi

#install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# adding zsh-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
