#!/bin/sh

DOTFILES=$HOME/dotfiles

# Delete existing dot files and folders
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.functions > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore_global > /dev/null 2>&1
sudo rm -rf ~/.oh-my-zsh > /dev/null 2>&1
sudo rm -rf ~/.antigen > /dev/null 2>&1
sudo rm -rf ~/.antigen.zsh > /dev/null 2>&1


# Create symlinks in the home folder
ln -sf $DOTFILES/zsh/zshrc ~/.zshrc
ln -sf $DOTFILES/zsh/functions ~/.functions
ln -sf $DOTFILES/git/gitconfig ~/.gitconfig
ln -sf $DOTFILES/git/gitignore_global ~/.gitignore_global

# Create dirs
mkdir $HOME/.virtualenvs
mkdir $HOME/projects

# Install antigen
curl -L git.io/antigen > ~/.antigen.zsh
