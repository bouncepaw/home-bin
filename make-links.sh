#!/bin/sh
set -euo pipefail
srcdir="$1"
destdir="$2"

fff () {
  ln -f -v -s $srcdir/$1 $destdir/$2
}

fff given.sh                         given
fff update-pacman-keys.sh            update-pacman-keys
fff soundcloud-cli-controls-dmenu.sh soundcloud-cli-controls-dmenu
fff soundcloud-cli-controls.sh       soundcloud-cli-controls
fff dwm-time.sh                      dwm-time
fff set-kb-layout.sh                 set-kb-layout
fff ../qara2c/qara2c.pl              qara2c
fff ../qara2rust/qara2rust.pl        qara2rust

