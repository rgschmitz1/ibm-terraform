#!/bin/bash

if which ibmcloud &> /dev/null; then
	echo 'ibmcloud already installed'
	exit 0
fi
# install IBM CLI
curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
# install plugins
ibmcloud plugin install -f -r "IBM Cloud" infrastructure-service
ibmcloud plugin install -f -r "IBM Cloud" schematics
