# home-bin

Scripts to be used in ~/bin

## Installation

```sh
cd ~/src # Or wherever you store repos
git clone https://github.com/bouncepar/home-bin.git
cd home-bin
./make-links.sh ~/src/home-bin ~/bin
# Also, add ~/bin to $PATH
```

The `make-links.sh` will create links from the folder where you have cloned this repository to and some other programs I created. If there is a conflict, destination file will get deleted, be careful.

## Program links

### given

Git client that only simplifies commands that I use a lot. Links to `given.sh` in this repo.

### set-kb-layout

Sets `setxkbmap` options. Links to `set-kb-layout.sh` in this repo.

### dwm-time

Prints time to DWM bar every second. I do not use DWM anymore. Links to `dwm-time.sh` in this repo.

### soundcloud-cli-controls

`soundcloud-cli-controls` is designed for those whomst want to change playing tracks, like, fast-forward, etc tracks on SoundCloud without pressing those irritating buttons on the site. The program doesn't use SoundCloud API, it just searches for a browser with SoundCloud opened and sends keypresses to it.

Currently supported browsers are Google Chrome, Mozilla Firefox and Qutebrowser but support for other browser can be added easily. By default, the program is configured for Mozilla Firefox. Hack the file `soundcloud-cli-controls.sh`.

To get list of actions, run `soundcloud-cli-controls help`.

### soundcloud-cli-controls-dmenu

Nice wrapper around the previous program using `dmenu`. It lists possible actions. Links to file `soundcloud-cli-controls-dmenu.sh`.

### update-pacman-keys

Update keys in `pacman`. It is required sometimes. Links to `update-pacman-keys.sh`.

