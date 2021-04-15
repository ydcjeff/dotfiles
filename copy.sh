#!/usr/bin/env sh

mkdir -pv $HOME/.config/{bspwm,dunst,polybar,rofi,sxhkd}

folders=(
  bspwm
  dunst
  polybar
  rofi
  sxhkd
)

for f in ${folders[@]}
do
  cp -Rv $HOME/.dotfiles/${f}/* $HOME/.config/${f}
done
