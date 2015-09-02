#!/bin/bash
set -e

if [ "$1" == "m" ]; then
  DEV_=$(dmesg | tail -n 20 | grep 'sd[b-f]:' | awk {'print $3'})
  if [ -z "$DEV_" ]; then echo "no device. exit"; exit; fi
  read -p "mount $DEV_ to /mnt2? <y>: " ANSWER
  if [ "$ANSWER" != "y" ]; then exit; fi
  sudo mount /dev/$DEV_ /mnt2
  echo "mounted $DEV_ to mnt2/"
else
  sudo umount /mnt2
fi
