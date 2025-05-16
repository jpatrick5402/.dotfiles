#update system
sudo pacman -Syu

#link nvim configs
ln -sf ~/.dotfiles/nvim/ ~/.config/

#install basic packages
sudo pacman -S man numlockx neovim ttf-firacode-nerd --noconfirm

#install config-specific packages
sudo pacman -S picom polybar feh rofi --noconfirm
