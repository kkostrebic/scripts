#!/bin/bash

service=/etc/systemd/system/lxd.service

cat > $service <<EOF
[Unit]
Description=LXD daemon
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=/usr/local/bin/lxd --group sudo

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable lxd.service
systemctl start lxd.service

# lxd needs to be initialized by running: 
# lxd init
