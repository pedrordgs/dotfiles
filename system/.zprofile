#!/bin/zsh

export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="brave"
export READER="zathura"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi


