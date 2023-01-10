#!/bin/bash
cd $(dirname $0)
[ -z "$1" ] && export mountpoint=/mnt/data || export mountpoint=$1
./clone_workflows.sh
./start_bwb.sh
