#!/bin/bash

# Install sudo and add provided user to sudo group
apt install sudo -y
usermod -aG sudo $1

# Install some packages
apt install net-tools build-essential module-assistant curl wget tmux zsh git -y

m-a prepare

# Create ssh key
echo Create ssh key
ssh-keygen -t rsa -b 4096

./setup_zsh_and_dot_files.bash
