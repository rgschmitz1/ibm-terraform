#!/bin/sh
sudo mkfs -t xfs /dev/vdb
sudo mkdir -p /mnt/data
sudo mount /dev/vdb /mnt/data
