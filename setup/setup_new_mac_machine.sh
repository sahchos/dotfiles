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

# Install pyenv
brew install pyenv
brew install --HEAD pyenv-virtualenv

# Install Docker.
brew install docker

# Fix:
# https://stackoverflow.com/questions/19215590/why-cant-i-install-any-gems-on-my-mac
brew tap raggi/ale && brew install openssl-osx-ca
# Useful OS X softwares.
# Great tool but the cask has been deleted - https://github.com/JadenGeller/Helium/issues/207
# brew cask install jadengeller-helium  # Web browser on top of all other windows
brew cask install iterm2

# Install fonts.
brew tap homebrew/cask-fonts
fonts=(
    font-source-code-pro
)
echo "Installing fonts..."
brew cask install ${fonts[@]}

brew cleanup
