# Install steam
choco install steam -y

# Install StartAllBack
choco install StartAllBack -y

# Set up sshfs
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut(".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Connect Pi.lnk")
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "`"$env:USERPROFILE\dotfiles\scripts\AutoConnectPi.ps1`""
$shortcut.Save()

