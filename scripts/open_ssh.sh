#!/bin/bash

set -e
set -u

# allow the ssh server to accept remove connections via ssh
cat <<EOF | sudo tee -a /etc/ssh/sshd_config
PasswordAuthentication yes
EOF

# restart the ssh server
sudo /etc/init.d/ssh restart
