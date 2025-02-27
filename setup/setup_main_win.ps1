cd ~

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git
choco install git -y

# Process to restart shell if git is not yet recognized as env var
function Restart-PowerShell {
  Start-Process powershell.exe -ArgumentList "-NoExit", "& '$($Script:MyInvocation.MyCommand.Path)'" -Verb RunAs
  exit
}
try {
    & git --version | Out-Null
    Write-Host "Git is installed (found in PATH)."
    $gitVersion = & git --version
    Write-Host $gitVersion
}
catch {
    Restart-PowerShell
}

# Configure git
git config --global user.email "jpatrick5402@gmail.com"
git config --global user.name "jpatrick5402"

# Pull dotfiles into home dir
cd ~
git clone https://github.com/jpatrick5402/dotfiles

# Install NVIM
cd ~
New-Item -ItemType SymbolicLink -Path .\AppData\Local\nvim -Target .\dotfiles\nvim\
choco install neovim -y
choco install mingw -y
choco install fzf -y
choco install nodejs -y
choco install neovide -y
choco install ripgrep -y

# Install/Set up AutoHotKey
choco install autohotkey -y
# Create AutoHotKey shortcut in startup folder
cd ~
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\AutoHotKey Main.lnk")
$shortcut.TargetPath = "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
$shortcut.Arguments = "`"$env:USERPROFILE\dotfiles\main.ahk`""
$shortcut.Save()

# Install Vivaldi
choco install Vivaldi -y

# Setup update dotfiles
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Update Dotfiles.lnk")
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "`"$env:USERPROFILE\dotfiles\scripts\updatedotfiles.ps1`""
$shortcut.Save()

# Install powertoys
choco install powertoys -y

# Install logitech options plus
choco install logioptionsplus -y

# Install the font
.\dotfiles\JetBrainsMonoNerdFont-Medium.ttf

# Install sshfs
choco install sshfs -y

# Decide if to perform personal install
function Confirm-Continue {
  param (
    [string]$Prompt = "Do you want to perform personal installations? (y/n)"
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

if (Confirm-Continue) {
    Write-Host "Continuing..."
    Start-Process powershell.exe -ArgumentList "-NoExit", "$env:USERPROFILE\dotfiles\setup\setup_personal_win.ps1" -Verb RunAs
} else {
    Write-Host "Exiting..."
  exit
}
