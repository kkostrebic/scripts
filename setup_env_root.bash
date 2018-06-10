#!/bin/bash

# Install sudo and add provided user to sudo group
apt install sudo -y
usermod -aG sudo $1

# Install some packages
apt install net-tools\
            build-essential\
            module-assistant\
            curl\
            wget\
            tmux\
            zsh\
            git\
            exuberant-ctags\
            dirmngr\
            ufw -y

# Install ripgrep (not available from package repository for debian)
# Note: check the correct (latest) version from https://github.com/BurntSushi/ripgrep/releases
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ripgrep_0.8.1_amd64.deb
rm ripgrep_0.8.1_amd64.deb

m-a prepare

# Create ssh key
echo Create ssh key
ssh-keygen -t rsa -b 4096

./setup_zsh_and_dot_files.bash

# Enable port forwarding
echo "1" > /proc/sys/net/ipv4/ip_forward


