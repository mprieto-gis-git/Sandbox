#!/bin/bash

set -e

AP7="/mnt/apprapd007"

lst=($AP7)

# Check if mount drive exists. If not, make one
for drv in ${lst[@]}; do
    if ! [ -d $drv ]; then
        mkdir -p ${drv}
    fi
done

mount -t drvfs A: $AP7
# mount -t drvfs P: $PROD

mountpoint -q "$AP7" && echo "Mounted: $AP7" || { echo "FAILED: $AP7" >&2; exit 1; }