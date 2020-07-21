#!/usr/bin/env bash

# ignored files list
declare -a ignore_list=(".git"
                        ".gitignore"
                        "README.md"
                        "scripts"
                    )

# go throw all files except ignore list
for file in ~/.dotfiles/*; do
  if [ -d ${file} ] && [[ ! ${file} =~ ${ignore_list[@]} ]]; then
    echo "Installing $(basename file)"
    sudo pacman -S $(basename file) --needed --noconfirm
    stow $(basename $file)
    if $SCRIPT_DEBUG; then echo "$(basename $file) stowed."; fi
  fi
done
