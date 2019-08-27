#!/bin/bash
# Soundcloud CLI controls version 1.1
# Check out https://github.com/bouncepaw/soundcloud-cli-controls
#
# This program makes it possible to control Soundcloud from CLI. You can also
# bind this program to hotkeys. Possibilities are endless.
#
# To make program function normally, it has to find a window with SoundCloud
# opened. If it doesn't, the program won't work. I put SoundCloud tab alone in
# a browser window where nothing but SoundCloud exists.

# Uncomment pattern according to your browser.
# Qutebrowser
# pattern_suffix=" - qutebrowser"
# Firefox
pattern_suffix=" - Mozilla Firefox"
# Chrome
# pattern_suffix=" - Google Chrome"
# TODO: add other patterns.
song_playing_pattern="by .*$pattern_suffix"
song_paused_pattern="SoundCloud$pattern_suffix"
song_playlist_pattern="in .*$pattern_suffix"

function get_sc_wid {
  # If found a SoundCloud window with a playing song
  if [[ $(wmctrl -l | grep "$song_playing_pattern") ]]; then
    echo $(wmctrl -l | grep "$song_playing_pattern" | cut -d ' ' -f1)
    # If the song is paused
  elif [[ $(wmctrl -l | grep "$song_paused_pattern") ]]; then
    echo $(wmctrl -l | grep "$song_paused_pattern" | cut -d ' ' -f1)
    # If playing a playlist
  elif [[ $(wmctrl -l | grep "$song_playlist_pattern") ]]; then
    echo $(wmctrl -l | grep "$song_playlist_pattern" | cut -d ' ' -f1)
  else
    echo "No SoundCloud window found." >&2
  fi
}

key=""

case $1 in
  pause)
    echo "Pause."
    key=space
    ;;
  next)
    echo "Next track."
    key="shift+Right"
    ;;
  repeat)
    echo "Repeat track."
    key=L
    ;;
  prev)
    echo "Previous track."
    key="shift+Left"
    ;;
  decrease)
    echo "Decrease volume."
    key="shift+Down"
    ;;
  increase)
    echo "Increase volume."
    key="shift+Up"
    ;;
  mute)
    echo "Mute volume."
    key=m
    ;;
  forward)
    echo "Forward."
    key="Right"
    ;;
  backward)
    echo "Backward."
    key="Left"
    ;;
  like)
    echo "Like track."
    key=l
    ;;
  shuffle)
    echo "Shuffle tracks."
    key="shift+s"
    ;;
  version)
    echo "soundcloud-cli-controls version 1.1"
    ;;
  help|-h|--help)
    echo Possible commands are: pause, next, repeat, prev, decrease,\
      increase, mute, forward, backward, like, shuffle.

    ;;
esac

xdotool key --window $(get_sc_wid) $key
