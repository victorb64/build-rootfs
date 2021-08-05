#!/bin/bash

# Create the rootfs and format it
if [[ "$SPARSE" -eq 1 ]]; then
    dd if=/dev/zero of="$1" bs=1 count=0 seek=800M > /dev/null
else
    dd if=/dev/zero of="$1" bs=4k count=204800 > /dev/null
fi
yes | mkfs.ext4 "$1" > /dev/null
