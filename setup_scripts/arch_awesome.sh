#update system
sudo pacman -Syu

#link nvim configs
ln -sf ~/.dotfiles/nvim/ ~/.config/

#install needed packages
sudo pacman -S man neovim ttf-firacode-nerd --noconfirm
