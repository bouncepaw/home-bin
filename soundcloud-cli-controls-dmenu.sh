#!/bin/bash
# soundcloud-cli-controls-dmenu version 1.0
# This script allows you to use soundcloud-cli-controls with dmenu.

choices="pause
next
like
mute
shuffle
prev
repeat
decrease
increase
mute
forward
backward"
choice=$(echo "$choices" | dmenu -i -p "Soundcloud CLI Controls:" -nb "#282828"\
  -nf "#ebdbb2" -sf "#ebdbb2" -sb "#83a598")
soundcloud-cli-controls $choice
