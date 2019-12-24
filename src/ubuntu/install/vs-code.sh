#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# alternative https://linoxide.com/linux-how-to/install-visual-studio-code-ubuntu-16-04/
# microsoft https://code.visualstudio.com/docs/setup/linux
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt-get install apt-transport-https
apt-get update
apt-get install -y code # or code-insiders

# You need to start vscode as a superuser with the user-data-dir arg to suppress a warning.
# code --user-data-dir="~/.vscode"
