#!/bin/bash

PKG="sudo pacman -S"
OPT="--needed --noconfirm"


$PKG dunst $OPT
$PKG i3 $OPT
$PKG neovim $OPT
$PKG polybar $OPT
$PKG ranger $OPT
$PKG rofi $OPT
$PKG git $OPT

$PKG zsh $OPT
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
chsh -s "$(command -v zsh)"

~/dotfiles/linking.sh
