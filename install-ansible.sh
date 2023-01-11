#!/bin/bash

if which ansible &> /dev/null; then
	echo 'ansible already installed'
	exit 0
fi

if ! which pip3 &> /dev/null; then
	sudo apt-get update && sudo apt-get install -y python3-pip || \
	(echo 'failed to install pip3'; exit 1)
fi

python3 -m pip install --upgrade --user ansible || exit $?
if ! grep -q '$HOME/.local/bin' $HOME/.bashrc; then
	echo 'export PATH="$PATH:$HOME/.local/bin"' >> $HOME/.bashrc
fi
