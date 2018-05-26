#!/bin/bash
TMP_OPT_PATH=/opt/golang-1.10.2
TMP_SRC_PATH=/usr/src/golang-1.10.2

# install go lang from repository
apt install golang -y

# function to get go version
# will return 7 in case 'go version' returns go1.7.4
function go_version {
  version=$(go version)
  regex="(go[0-9].([0-9]+).[0-9])"
  if [[ $version =~ $regex  ]]; then
    echo ${BASH_REMATCH[2]}
  fi
}

# exit script if the go lang version is 1.8 or greater
# lxd needs go lang version 1.8+
if [ $(go_version) -ge 8 ]; then
  echo 'Current version is '$(go version)
  exit
fi

if [ -d $TMP_OPT_PATH  ]; then
  rm -rf $TMP_OPT_PATH
fi

if [ -d $TMP_SRC_PATH  ]; then
  rm -rf $TMP_SRC_PATH
fi

# install go lang from source
git clone https://go.googlesource.com/go $TMP_OPT_PATH
ln -s $TMP_OPT_PATH/src $TMP_SRC_PATH
cd $TMP_OPT_PATH
git checkout go1.10.2
cd src
./all.bash

for filename in $TMP_OPT_PATH/bin/*; do
  basename=$(basename $filename)
  target_path=/usr/bin/$basename
  if [ -e $target_path  ]; then
    mv $target_path $target_path.old 
  fi
  ln -s $filename $target_path
done
