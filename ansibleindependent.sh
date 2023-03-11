#!/bin/bash

if [ -f /etc/redhat-release ]; then
    OS_TYPE="redhat"
    PKG_MGR="yum"
elif [ -f /etc/debian_version ]; then
    OS_TYPE="debian"
    PKG_MGR="apt-get"
else
    echo "Unsupported OS type"
    exit 1
fi
if [ $OS_TYPE == "redhat" ]; then
    sudo $PKG_MGR install epel-release -y
fi
sudo $PKG_MGR update -y
sudo $PKG_MGR install ansible -y
ansible --version
