sudo pacman -S mako qt5-wayland qt6-wayland waybar hyprpaper wl-clipboard wl-clip-persist imagemagick hyprlock hypridle btop fish wf-recorder

cd ~
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
