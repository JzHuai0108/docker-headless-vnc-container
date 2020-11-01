
#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install oh-my-zsh"
# https://gist.github.com/MichalZalecki/4a87880bbe7a3a5428b5aebebaa5cd97
# https://kifarunix.com/how-to-install-and-setup-zsh-and-oh-my-zsh-on-ubuntu-18-04/
apt-get update
apt-get install -y zsh
mkdir -p /tmp/oh-my-zsh
cd /tmp/oh-my-zsh
git clone --recursive https://github.com/ohmyzsh/ohmyzsh.git
zsh ./ohmyzsh/tools/install.sh -y
chsh -s $(which zsh)

echo "\nsource /opt/ros/$ROS_VERSION/setup.zsh" >> ~/.zshrc
rm -rf /tmp/oh-my-zsh
apt-get clean -y
