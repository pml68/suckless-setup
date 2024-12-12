# suckless-setup

My personal suckless setup.

- Rosé Pine color scheme and JetBrainsMono Nerd Font by default (colors from [Rosé Pine for st](https://github.com/rose-pine/st))
- General purpose keybindings:
    - Alt+Shift+D: Opens Discord
    - Alt+Shift+F: Opens Zen Browser
    - PrtScr: Opens Flameshot

## Dependencies
Install necessary packages (Arch Linux specific, other distros will differ)
```sh
sudo pacman -S picom feh flameshot ttf-jetbrains-mono-nerd libqalculate
```

## Installation

### Manual

Clone the repo
```sh
git clone https://github.com/pml68/suckless-setup
cd suckless-setup/
```

Replace config files
```sh
sudo cp picom.conf /etc/xdg/picom.conf

# optional
cp neofetch -r ~/.config/
cp vis -r ~/.config/ # for https://github.com/dpayne/cli-visualizer

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux -r ~/.config

# Start tmux, and install necessary plugins with C-a I
```

Build and install each suckless program
```sh
cd dwm
sudo make clean install
cd ..

cd dmenu
sudo make clean install
# ...
```

Set the background
```sh
feh --bg-fill wallpaper.jpg
```

Update your .xinitrc file
```sh
# ...
~/.fehbg &
picom &
flameshot &
slstatus &
exec dwm
```

### Automated

Simply run the included script
```sh
chmod +x install.sh
./install.sh
```

# Screenshot:

![Screenshot](screenshot.png)
