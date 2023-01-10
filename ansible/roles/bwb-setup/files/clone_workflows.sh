#!/bin/bash
[ -z "$mountpoint" ] && mountpoint=/mnt/data
[ -z "$workflow_repo" ] && workflow_repo='https://github.com/Biodepot-LLC/workflows.git'
git clone $workflow_repo $mountpoint/workflows
