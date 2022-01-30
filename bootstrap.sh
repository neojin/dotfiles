#!/bin/bash

########## Variables

dir=~/dotfiles # dotfiles directory
files="gitconfig gitignore vim init.vim" # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# create symlinks
for file in $files; do
  echo "Creating symlink to $file in home directory."
  rm ~/.$file
  ln -s $dir/$file ~/.$file
done

# symlink neovim
rm ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim
ln -s $dir/init.vim ~/.config/nvim/init.vim
