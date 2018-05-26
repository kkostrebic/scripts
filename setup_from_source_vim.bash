#!/bin/bash

# Create variables
TMP_OPT_PATH=/opt/vim
TMP_SRC_PATH=/usr/src/vim

# Get vim source
git clone https://github.com/vim/vim.git /opt/vim

# Remove old installed vim instances 
apt remove --purge vim*

# Install required packages
apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev -y
apt install python-dev ruby-dev libperl-dev -y

# Make link to source 
ln -s $TMP_OPT_PATH/src $TMP_SRC_PATH

# Build
cd $TMP_OPT_PATH/src
make distclean
./configure \
  --with-features=huge \
  --enable-rubyinterp \
  --enable-largefile \
  --disable-netbeans \
  --enable-multibyte\
  --enable-python3-interp\
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7/config \
  --enable-perlinterp \
  --enable-gui=auto \
  --enable-fail-if-missing \
  --enable-cscope 
make
make install

if [ -e /usr/bin/vi ] && [ -e /usr/local/bin/vim ];  then
  rm /usr/bin/vi
  ln -s /usr/local/bin/vim /usr/bin/vi
fi

if [ -e /usr/bin/vim ] && [ -e /usr/local/bin/vim ];  then
  rm /usr/bin/vim
  ln -s /usr/local/bin/vim /usr/bin/vim
fi

