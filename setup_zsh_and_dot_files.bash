#!/bin/bash

# Install oh-my-zsh
export ZSH=/usr/local/share/zsh/.oh-my-zsh
if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Get or update dot files 
CONFIG=/usr/local/share/dot-files
if [ ! -d $CONFIG ]; then
  git clone https://github.com/kkostrebic/dot-files.git $CONFIG
fi

# Link dot files
for fullfilename in $CONFIG/.*; do
  filename=$(basename $fullfilename)
  if [ -d $fullfilename ]; then
    continue
  fi
  if [ -f ~/$filename ]; then
    rm ~/$filename
  fi
  ln -s $fullfilename ~/$filename
done

# Set oh-my-zsh theme 
if [ ! -f $ZSH/themes/kenan-custom.zsh-theme ]; then
  ln -s $CONFIG/kenan-custom.zsh-theme $ZSH/themes/kenan-custom.zsh-theme
fi
