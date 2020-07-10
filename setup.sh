#!/bin/bash
ORIGIN=$(pwd)

DOT_FILES=( .bashrc .gitconfig .vimrc )

for file in ${DOT_FILES[@]}
do
    if [ -e $HOME/$file ]; then
        echo $HOME/$file exist. backup file $HOME/$file~ is created.
    fi
    ln -sb $HOME/dotfiles/$file $HOME/$file
    mkdir -p $HOME/.config
    ln -s $HOME/dotfiles/fish $HOME/.config/
done

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim -c "PluginInstall" -c q
