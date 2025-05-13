#!/bin/bash
set +e

cd ~

# update arch
sudo pacman -Syu --noconfirm

# create symlinks for .dotfiles/nix_configs/
cd ~/.dotfiles/nix_configs
find . -maxdepth 1 | while read file; do ln -s ~/.dotfiles/nix_configs/$file ~/; done

# nvim separate due to location
rm -rf ~/.config/nvim
ln -sf ~/.dotfiles/nvim/ ~/.config/nvim

# install basic apps
sudo pacman -S maim pipewire-pulse playerctl libreoffice-still zip unzip ripgrep rofi npm zsh arandr blueman polybar picom feh git alacritty neovim base-devel fzf ttf-3270-nerd ttf-firacode-nerd firefox man less bluez bluez-utils --noconfirm

# install AUR packages (Way faster than all at once)
# install yay first
if pacman -Qs yay > /dev/null; then
  echo "Yay is installed"
else
  cd && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si --noconfirm
  cd
fi
yay -S visual-studio-code-bin clipmenu-rofi

# install printer drivers
read -p "Do you want to install printer drivers for your black printer? (y/n) " response
if [[ "$response" == "y" || "$response" == "Y" ]]; then
  cd
  git clone https://aur.archlinux.org/cnijfilter2.git
  cd cnijfilter2/
  makepkg -si --noconfirm
fi

# install sddm theme
read -p "Do you want to install sddm-astronaut-theme? (y/n) " response
if [[ "$response" == "y" || "$response" == "Y" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
fi

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# adding zsh-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
