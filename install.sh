#!/bin/sh
dirs=("dwm" "dmenu" "slstatus" "st")

for dir in "${dirs[@]}"; do
  (cd "$dir" && sudo make clean install)
done
