#!/bin/bash

# Install required packages
apt install wget build-essential tcl -y

# Get redis
wget http://download.redis.io/releases/redis-4.0.9.tar.gz

# Unpack
tar -xzvf redis-4.0.9.tar.gz

# Move it to /opt
mv redis-4.0.9 /opt

cd /opt/redis-4.0.9
make 
make install 

# Make some configuration
# ulimit -n

