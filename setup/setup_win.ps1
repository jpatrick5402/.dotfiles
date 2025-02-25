cd ~

# SFTP Drive - https://www.callback.com/sftpdrive
# ^not sure how to implement

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git
choco install git -y --force

# Pull dotfiles into home dir
cd ~
git clone https://github.com/jpatrick5402/dotfiles

# Install NVIM
cd ~
New-Item -ItemType SymbolicLink -Path .\AppData\Local\nvim -Target .\dotfiles\nvim\
choco install neovim -y --force
choco install mingw -y --force
choco install fzf -y --force
choco install nodejs -y --force

# Set up AutoHotKey
choco install autohotkey -y --force
# Create AutoHotKey shortcut in startup folder
cd ~
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Local\Microsoft\Windows\Start Menu\Programs\Startup\AutoHotKey Main.lnk")
$shortcut.TargetPath = "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
$shortcut.Arguments = "`".\dotfiles\main.ahk`""
$shortcut.Save()

# Install Vivaldi
choco install Vivaldi -y --force
