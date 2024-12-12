#!/bin/sh
dirs="dwm dmenu slstatus st"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

for dir in $dirs; do
  (cd "$dir" && echo "starting $dir installation" && make clean install && echo "$dir installation complete")
done

if command_exists feh; then
  feh --bg-fill wallpaper.jpg
  echo "~/.fehbg &" >> ~/.xinitrc
fi

if command_exists picom; then
  cp picom.conf /etc/xdg/picom.conf
  echo "picom &" >> ~/.xinitrc
fi

command_exists flameshot && echo "flameshot &" >> ~/.xinitrc

command_exists neofetch && cp neofetch -r ~/.config/

command_exists vis && cp vis -r ~/.config/

if command_exists tmux; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cp tmux -r ~/.config/
fi

echo "slstatus &" >> ~/.xinitrc
echo "exec dwm" >> ~/.xinitrc
