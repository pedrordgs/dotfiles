#!/bin/bash

sudo pacman -S dunst --needed --noconfirm
ln -sf ~/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
