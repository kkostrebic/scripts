#!/bin/bash

# Create ssh key
echo Create ssh key
ssh-keygen -t rsa -b 4096

./setup_zsh_and_dot_files.bash

# Set zsh shell if current is different one
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi

# Create initial .ctags file
CTAGS_PATH=~/.ctags

cat > $CTAGS_PATH <<EOF
--recurse=yes
--exclude=.git
--exclude=vendor/*
--exclude=node_modules/*
--exclude=db/*
--exclude=log/*
--exclude=min
--exclude=vendor
--exclude=\*.min.\*
--exclude=\*.map
--exclude=\*.swp
--exclude=\*.bak
--exclude=tags
--exclude=test
--exclude=build
--exclude=dist
--exclude=*.bundle.*
EOF
