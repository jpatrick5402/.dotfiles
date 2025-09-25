sudo pacman -S mako qt5-wayland qt6-wayland waybar hyprpaper wl-clipboard wl-clip-persist imagemagick hyprlock hypridle btop fish wf-recorder ttf-firacode-nerd firefox neovim

# Make sure if using Nvidia GPU, you install the below package (https://wiki.archlinux.org/title/NVIDIA)
# sudo pacman -S nvidia

# Install yay if not already installed
if pacman -Qs yay > /dev/null; then echo "\033[1;32mYay is already installed"
else
	sudo pacman -S --needed git base-devel
	cd && git clone https://aur.archlinux.org/yay.git && cd yay
	makepkg -si --noconfirm && cd
	echo "\033[1;32mYay is now installed"
	rm -rf ~/yay/
fi

mkdir ~/.config/kitty/
mkdir ~/.config/waybar/
mkdir ~/.config/mako/
mkdir ~/.config/wofi/
mkdir ~/.config/hypr/
mkdir ~/.config/fish/

ln -sf ~/.dotfiles/nvim/ ~/.config/nvim/
ln -sf ~/.dotfiles/configs_linux/v2/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/.dotfiles/configs_linux/v2/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/.dotfiles/configs_linux/v2/waybar/style.css ~/.config/waybar/style.css
ln -sf ~/.dotfiles/configs_linux/v2/mako/config ~/.config/mako/config
ln -sf ~/.dotfiles/configs_linux/v2/wofi/config ~/.config/wofi/config
ln -sf ~/.dotfiles/configs_linux/v2/wofi/style.css ~/.config/wofi/style.css
ln -sf ~/.dotfiles/configs_linux/v2/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf ~/.dotfiles/configs_linux/v2/hypr/hypridle.conf ~/.config/hypr/hypridle.conf
ln -sf ~/.dotfiles/configs_linux/v2/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
ln -sf ~/.dotfiles/configs_linux/v2/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -sf ~/.dotfiles/configs_linux/v2/fish/config.fish ~/.config/fish/config.fish

chsh -s /usr/bin/fish
