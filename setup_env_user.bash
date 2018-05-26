#!/bin/bash

# Create ssh key
echo Create ssh key
ssh-keygen -t rsa -b 4096

./setup_zsh_and_dot_files.bash

# Set zsh shell if current is different one
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi
