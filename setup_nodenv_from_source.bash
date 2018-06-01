#!/bin/bash

# Set variables
TMP_PATH=/opt/nodenv
TMP_SRC_PATH=/usr/src/nodenv

# Clone the repository
git clone https://github.com/nodenv/nodenv.git $TMP_PATH

# Make link to nodenv src 
ln -s $TMP_PATH/src $TMP_SRC_PATH

# Compile dynamic bash extension to speed up nodenv. 
# Don't worry if it fails; nodenv will still work normally
cd $TMP_SRC_PATH && ./configure && make

# Add binary links to /usr/local/bin
for filename in $TMP_PATH/bin/*; do
  basename=$(basename $filename)
  target_path=/usr/local/bin/$basename
  if [ -e $target_path ]; then
    mv $target_path $target_path.old
  fi
  ln -s $filename $target_path
done

# Initialize 
$TMP_PATH/bin/nodenv init
