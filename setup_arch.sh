cd
sudo pacman -Syu
# install/config git
sudo pacman -S git
git config --global user.name jpatrick5402
git config --global user.email jpatrick5402@gmail.com
# add dotfiles
git clone https://github.com/jpatrick5402/dotfiles.git
mkdir .config/
ln -s ~/dotfiles/nvim/ ~/.config/nvim
# build neovim: follow https://github.com/neovim/neovim/blob/master/BUILD.md
sudo pacman -S base-devel cmake unzip ninja curl npm
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
# install z
git clone https://github.com/rupa/z.git
echo ". /home/jpatrick5402/z/z.sh" >> .bashrc
# install fzf
sudo pacman -S fzf
# customize prompt
echo 'PS1="┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]\n└─╼ "' >> .bashrc
