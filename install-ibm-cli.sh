#!/bin/bash

which ibmcloud &> /dev/null && exit 0
curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
