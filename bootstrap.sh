#!/bin/bash

########## Variables

dir=~/dotfiles # dotfiles directory
files="gitconfig gitignore vim vimrc" # list of files/folders to symlink in homedir

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
