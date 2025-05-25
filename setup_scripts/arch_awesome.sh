#!/bin/bash
cd ~

#update system
sudo pacman -Syu
echo "\033[1;32mSystem updated"

#link nvim configs
ln -sf ~/.dotfiles/nvim/ ~/.config/
echo "\033[1;32mnvim configs are linked"

#install basic packages
sudo pacman -S bc playerctl btop zip unzip gcc ripgrep tree man numlockx neovim ttf-firacode-nerd base-devel --noconfirm
echo '\033[1;32mBasic packages are installed'

#install config-specific packages
sudo pacman -S zsh-syntax-highlighting maim dmenu zsh picom rofi --noconfirm
echo "\033[1;32mConfig packages are installed"

#install yay
if pacman -Qs yay > /dev/null; then echo "\033[1;32mYay is already installed"
else
  cd && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si --noconfirm && cd
  echo "\033[1;32mYay is now installed"
fi
rm -rf ~/yay/

#install AUR packages
PACKAGES=(
  "clipmenu-rofi"
  "i3lock-color"
  "xautolock"
  )
for package in "${PACKAGES[@]}"; do
  if pacman -Qs ${package} > /dev/null; then
    echo "\033[1;32m${package} already installed"
  else
    yay -S ${package} --noconfirm
    echo "\033[1;32m{$package} is now installed"
  fi
done

#install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "\033[1;32mohmyzsh is now installed"

#install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "\033[1;32mzsh-autosuggestions is now installed"

#install zsh line
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
echo "\033[1;32mpowerlevel10k is now installed"
