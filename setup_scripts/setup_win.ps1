# To run this script on a new machine run
# set-executionPolicy Bypass

cd ~

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git
choco install git -y

# Process to refresh environment variables
$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."   
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
Update-SessionEnvironment

# Configure git
git config --global user.email "jpatrick5402@gmail.com"
git config --global user.name "jpatrick5402"

# Pull dotfiles into home dir
cd ~
git clone https://github.com/jpatrick5402/.dotfiles

# Set dotfiles as safe dir
git config --global --add safe.directory C:/Users/jpatric5/.dotfiles

# Install NVIM
cd ~
New-Item -ItemType SymbolicLink -Path .\AppData\Local\nvim -Target $env:USERPROFILE\.dotfiles\nvim\
choco install neovim -y
choco install mingw -y
choco install fzf -y
choco install nodejs -y
choco install ripgrep -y

# Install ShareX
choco install sharex -y

# Install Python
choco install python -y

# Install Go
choco install go -y

# Install vscode
choco install vscode -y

# Install/Set up AutoHotKey
choco install autohotkey -y
# Create AutoHotKey shortcut in startup folder
cd ~
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\AutoHotKey Main.lnk")
$shortcut.TargetPath = "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
$shortcut.Arguments = "`"$env:USERPROFILE\.dotfiles\main.ahk`""
$shortcut.Save()

# Install Vivaldi
choco install Vivaldi -y

# Setup update dotfiles
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Update Dotfiles.lnk")
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "`"$env:USERPROFILE\.dotfiles\scripts\updatedotfiles.ps1`""
$shortcut.Save()

# Install powertoys
choco install powertoys -y

# Install logitech options plus
choco install logioptionsplus -y

# Install sshfs
choco install sshfs -y

# Add git command to environment variables
if (-not ([Environment]::GetEnvironmentVariable("Path", "user") -split ';' -contains "C:\Program Files\Git\usr\bin")) {
    $temppath=[Environment]::GetEnvironmentVariable("Path", "user")+";C:\Program Files\Git\usr\bin"
    [Environment]::SetEnvironmentVariable("Path", $temppath , "User")
}

# Install Mouse Without Borders
choco install mousewithoutborders -y

# Decide if to perform personal install
function Confirm-Continue {
    param (
    [string]$Prompt = " (y/n)"
    )
    while ($true) {
        $response = Read-Host -Prompt $Prompt

        if ($response -eq "y" -or $response -eq "Y") {
            return $true
        } elseif ($response -eq "n" -or $response -eq "N") {
            return $false
        } else {
            Write-Host "Invalid input. Please enter 'y' or 'n'."
        }
    }
}

# Check to see if this is a work installation
Write-Host -NoNewLine "Would you like to perform WORK installations?"
if (Confirm-Continue) {

    # Install/Setup Mouse tool
    choco install mouse-jiggler -y
    $shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Mouse.lnk")
    $shortcut.TargetPath = "`"C:\ProgramData\chocolatey\bin\MouseJiggler.exe`""
    $shortcut.Arguments = "`"-jzm`""
    $shortcut.Save()
}

# Check to see if this is a personal installation
Write-Host -NoNewLine "Would you like to perform PERSONAL installations?"
if (-not (Confirm-Continue)) {
    Write-Host "Exiting..."
    exit
}

# Install steam
choco install steam -y

# Install StartAllBack
choco install StartAllBack -y

# Set up sshfs
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Connect Pi.lnk")
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "`"$env:USERPROFILE\.dotfiles\scripts\AutoConnectPi.ps1`""
$shortcut.Save()
