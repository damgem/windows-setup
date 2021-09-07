# Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Browser
choco install Firefox edgedeflector -y

# Social
choco install Thunderbird discord.install whatsapp telegram.install signal skype teamspeak teamviewer zoom -y
	
# Media
choco install spotify sonos-controller -y

# WSL2
choco install wsl2 wsl-ubuntu-2004 microsoft-windows-terminal -y

# Code Editors
choco install vscode intellijidea-ultimate notepadplusplus neovim -y
  
# Coding Utility
choco install postman octave -y
  
# Productivity
choco install audacity gimp handbreak clipstudio-paint -y

# Windows
choco install nextcloud-client 7zip -y
  
# Utility
choco install adobereader vlc pia rufus bitwarden keyboard-layout-creator -y

# Games
choco install origin steam-client faceit minecraft-launcher epicgameslauncher -y

# Create Virtual Dev Drive (https://dev.to/iainrough/map-a-local-folder-to-a-drive-letter-windows-10-1b07)
mkdir $HOME/Dev
subst D: $HOME/Dev # Mount Virtual Dev Drive
# Mount Virtual Dev Drive On Startup
New-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\mount_dev.bat"
Set-Content "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\mount_dev.bat" "subst D: $HOME\Dev"

# Disable Shortcuts like '3D Objects' | Restart needed for these changes to take effect
# (https://www.techspot.com/guides/1703-remove-3d-objects-shortcut-windows-file-explorer)
wget "https://www.techspot.com/files/RegistryShortcutsW1064bit.zip" -outfile ~/Downloads/regshortcuts.zip
Expand-Archive ~/Downloads/regshortcuts.zip ~/Downloads/regshortcuts
reg import "$HOME/Downloads/regshortcuts/Disable 3D Objects Folder Win10 64.reg"
reg import "$HOME/Downloads/regshortcuts/Disable Videos Folder Win10 64.reg"
reg import "$HOME/Downloads/regshortcuts/Disable Music Folder Win10 64.reg"
reg import "$HOME/Downloads/regshortcuts/Disable Pictures Folder Win10 64.reg"
reg import "$HOME/Downloads/regshortcuts/Disable Quick Access Win10 64.reg"

# Show file extensions in the file explorer (https://stackoverflow.com/a/8110982)
Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' Hidden 1
Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' HideFileExt 0
Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' ShowSuperHidden 1

# Restart explorer
Stop-Process -processname explorer
