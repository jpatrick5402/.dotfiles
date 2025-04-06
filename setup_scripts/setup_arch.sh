cd ${HOME}

# update arch
sudo pacman -Syu --noconfirm

# install/config git
sudo pacman -S git --noconfirm
git config --global user.name jpatrick5402
git config --global user.email jpatrick5402@gmail.com

# add dotfiles
git clone https://github.com/jpatrick5402/dotfiles.git
mkdir .config/

# install fzf
sudo pacman -S fzf --noconfirm

# customize prompt
echo 'PS1="┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]\n└─> "' >> ~/.bashrc

# install print drivers
cd
git clone https://aur.archlinux.org/cnijfilter2.git
cd cnijfilter2/
makepkg -si

# install audio resources
sudo pacman -S bluez pulseaudio pulseaudio-bluetooth pulseaudio-jack --noconfirm

# install i3 resources
sudo pacman -S polybar picom --noconfirm

# create symlinks for dotfiles
DIR=${HOME}/.dotfiles/nix_configs
DOTFILES=(
 ".Xresources"
 "polybar/config.ini"
 "i3/config"
)
for dotfile in "${DOTFILES[@]}"; do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
