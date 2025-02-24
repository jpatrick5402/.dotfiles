cd ~
git clone https://github.com/jpatrick5402/dotfiles
# SFTP Drive - https://www.callback.com/sftpdrive
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Install NVIM
cd ~
New-Item -ItemType SymbolicLink -Path C:\Users\$env:username\AppData\Local\nvim -Target C:\Users\$env:username\dotfiles\nvim\
choco install neovim
choco install mingw
choco install fzf
winget install --id OpenJS.NodeJS
