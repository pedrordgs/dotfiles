#!/usr/bin/env bash

# ignored files list
declare -a ignore_list=(".git"
                        ".gitignore"
                        "README.md"
                        "scripts"
                    )

sudo pacman -S stow

# go throw all files except ignore list
for file in ~/.dotfiles/*; do
  if [ -d ${file} ] && [[ ! ${file} =~ ${ignore_list[@]} ]]; then
    echo "Installing $(basename $file)"
    sudo pacman -S $(basename $file) --needed --noconfirm
    stow $(basename $file)
    if $SCRIPT_DEBUG; then echo "$(basename $file) stowed."; fi
  fi
done

# Install vundle and vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# install all dependencies
# while read line;
# do
#     echo "Installing $line"
#     sudo pacman -S $line --needed --noconfirm
# done

# install fonts
echo "Installing Cascadia Code"
sudo pacman -S ttf-cascadia-code --needed --noconfirm
echo "Installing Ionicons"
sudo pacman -S ttf-ionicons --needed --noconfirm
echo "Installing Font Awesome"
sudo pacman -S ttf-font-awesome --needed --noconfirm

# cp scripts dir to $HOME
cp -r scripts ~/.scripts

# change shell to zsh
chsh -s $(which zsh)
