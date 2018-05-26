#!/bin/bash

# Install required packages
apt install acl dnsmasq-base git golang liblxc1 lxc-dev libacl1-dev make pkg-config rsync squashfs-tools tar xz-utils -y
apt install libapparmor-dev libseccomp-dev libcap-dev -y
apt install lvm2 thin-provisioning-tools -y
apt install btrfs-tools -y
apt install curl gettext jq sqlite3 uuid-runtime bzr -y

# Create directories and variables
mkdir -p /opt/lxd-3.0
export GOPATH=/opt/lxd-3.0
TMP_SRC_PATH=/usr/src/lxd-3.0

# Fetch the source
go get -d -v github.com/lxc/lxd/lxd

# Switch to 3.0 version (latest LTS version)
cd $GOPATH/src/github.com/lxc/lxd
git checkout stable-3.0

# Make link to lxd source
ln -s $GOPATH/src/github.com/lxc/lxd $TMP_SRC_PATH
cd $GOPATH/src/github.com/lxc/lxd

# Build
make

# Make /usr/local/bin links to binaries 
for filename in $GOPATH/bin/*; do
  basename=$(basename $filename)
  target_path=/usr/local/bin/$basename
  if [ -e $target_path  ]; then
    mv $target_path $target_path.old 
  fi
  ln -s $filename $target_path
done

# Enable unprivileged containers
echo "root:1000000:65536" | tee -a /etc/subuid /etc/subgid

# Run daemon:
# sudo -E $GOPATH/bin/lxd --group sudo
