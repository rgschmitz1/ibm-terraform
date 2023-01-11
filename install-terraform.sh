#!/bin/bash

if which terraform &> /dev/null; then
	echo 'terraform already installed'
	exit 0
fi

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common || (echo 'failed to install dependencies'; exit 1)

wget -O- https://apt.releases.hashicorp.com/gpg | \
    sudo gpg --dearmor --output /usr/share/keyrings/hashicorp-archive-keyring.gpg

if ! gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint | grep -q 'E8A0 32E0 94D8 EB4E A189  D270 DA41 8C88 A321 9F7B'; then
	sudo rm /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo 'failed to verify HashiCorp gpg key fingerprint'
	exit 1
fi

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(awk -F= '/UBUNTU_CODENAME/ {print $NF}' /etc/os-release) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update && sudo apt-get install terraform
