#!/bin/bash
# Set a mountpoint
[ -z "$mountpoint" ] && mountpoint=/mnt/data

# Find a workflow if passed
[ -n "$workflow" ] && \
	workflow=$(find $mountpoint -type f -name "$workflow.ows" | sed "s|^$mountpoint|/data|")

# Pull the latest version of Bwb
#sudo docker pull biodepot/bwb:latest

# Map/expose port 6080->6080 and 5900->5900
cmd="sudo docker run --rm -d -p 6080:6080 -p 5900:5900 -v $mountpoint:/data "
# Load workflow if it exists
[ -n "$workflow" ] && cmd+="-e STARTING_WORKFLOW=$workflow "
cmd+="-v /var/run/docker.sock:/var/run/docker.sock 
-v /tmp/.X11-unix:/tmp/.X11-unix 
--privileged 
--group-add root biodepot/bwb:latest"
# Start Bwb
$cmd
