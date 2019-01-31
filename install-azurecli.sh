#!/bin/bash

# ===================================================================
# Purpose:           To automate the install of the Azure CLI
# Parameters:        None
# Author:            Jason Vriends
# Notes:             Tested against Ubuntu 18.04-LTS on Microsoft Azure as a Linux Custom Script Extension.
# ===================================================================

# Modify your sources list
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Get the Microsoft signing key
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Install Azure CLI
sudo apt-get update
sudo apt-get install apt-transport-https azure-cli -y
