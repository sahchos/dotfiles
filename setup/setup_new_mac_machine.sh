#!/usr/bin/env bash
set -euo pipefail

# pip is not installed by default on mac.
sudo easy_install pip
# Upgrade pip to the latest version
sudo pip install --upgrade pip

# force pip to python3 version
python3 -m pip install --upgrade --force pip

sudo pip install Pygments
sudo pip install pipenv
sudo pip install virtualenvwrapper
sudo pip install flake8

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Update homebrew recipes
brew update
brew install zsh
brew install shellcheck  # Linter for shell scripts
chsh -s $(which zsh)
brew install htop
brew install node

# rupa z jump around
brew install z
# utils like imv
brew install renameutils
# utils like ftp
brew install inetutils

# install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# Install pyenv
brew install pyenv
brew install --HEAD pyenv-virtualenv

# Install direnv to allow directory based env variables
brew install direnv

# Install Docker.
brew cask install docker

# Fix:
# https://stackoverflow.com/questions/19215590/why-cant-i-install-any-gems-on-my-mac
brew tap raggi/ale && brew install openssl-osx-ca
# Useful OS X softwares.
brew cask install iterm2
brew cask install sublime-text
brew cask install pycharm
brew cask install insomnia
brew cask install telegram

# Install fonts.
brew tap homebrew/cask-fonts
fonts=(
    font-source-code-pro
)
echo "Installing fonts..."
brew cask install ${fonts[@]}

brew cleanup
