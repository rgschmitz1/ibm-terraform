#!/bin/bash

which ibmcloud &> /dev/null && exit 0
curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
ibmcloud plugin install -f -r "IBM Cloud" infrastructure-service
ibmcloud plugin install -f -r "IBM Cloud" schematics
