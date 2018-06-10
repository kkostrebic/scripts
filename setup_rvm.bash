#!/bin/bash

# Note: Pass the user name as param in order to assign it to rvm group

# Get rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# Add user to rvm group
usermod -aG rvm $1

# Initialize rvm for current open shell 
source /etc/profile.d/rvm.sh

# In case of zsh add this line to the end of .zshrc
# source /etc/profile.d/rvm.sh
