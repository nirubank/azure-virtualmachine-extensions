#!/bin/bash

# ===================================================================
# Purpose:           To automate the install of Docker and Docker Compose.
# Parameters:        None
# Author:            Jason Vriends
# Notes:             Tested against Ubuntu 18.04-LTS on Microsoft Azure as a Linux Custom Script Extension.
# ===================================================================

# Updates package lists from installed repositories on the newest versions of packages and their dependencies
apt-get update

# Install Docker from Official Docker Repository

## Install Dependencies
apt install -y apt-transport-https ca-certificates curl software-properties-common

## Add Docker Repository
cat <<EOF > /etc/apt/sources.list.d/docker.list
deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
EOF

## Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Updates package lists from installed repositories on the newest versions of packages and their dependencies
apt-get update

## Install Docker CE
apt-get install -y docker-ce

# Create a local Docker group
groupadd docker

# Use Docker commands without sudo (add non-system accounts to the local Docker group)
awk -F: '($3>=1000)&&($1!="nobody"){system("usermod -aG docker " $1)}' /etc/passwd

# Install Docker Compose from Official Docker Repository
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

## Grant execute permission to Docker Compose
chmod +x /usr/local/bin/docker-compose

