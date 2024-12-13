#!/bin/sh
programs="dwm dmenu slstatus st"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

has_root_perms() {
  [ "$(id -u)" -eq 0 ] || [ -n "$SUDO_UID" ]
}

for program in $programs; do
  has_root_perms && (cd "$program" && echo "starting $program installation" && make clean install && echo "$program installation complete") || echo "Can't install $program: you must run the script as root or with sudo."
done

if command_exists feh; then
  feh --bg-fill wallpaper.jpg
  echo "~/.fehbg &" >>~/.xinitrc
fi

if command_exists picom; then
  has_root_perms && cp picom.conf /etc/xdg/picom.conf || echo "Can't install picom configuration: you must run the script as root or with sudo."
  echo "picom &" >>~/.xinitrc
fi

command_exists flameshot && echo "flameshot &" >>~/.xinitrc

command_exists neofetch && cp neofetch -r ~/.config/

command_exists vis && cp vis -r ~/.config/

if command_exists tmux; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cp tmux -r ~/.config/
fi

echo "slstatus &" >>~/.xinitrc
echo "exec dwm" >>~/.xinitrc
