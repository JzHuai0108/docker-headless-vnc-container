
#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tools for ssh connection"

apt-get update
apt-get install -y openssh-server
echo 'root:vncpassword' | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i '/RSAAuthentication yes/c\RSAAuthentication no' /etc/ssh/sshd_config
sed -i '/PubkeyAuthentication yes/c\PubkeyAuthentication no' /etc/ssh/sshd_config
sed -i '/PasswordAuthentication yes/c\PasswordAuthentication yes' /etc/ssh/sshd_config
sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

apt-get clean -y
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*