#!/usr/bin/env bash
set -euo pipefail

# pip is not installed by default on mac.
sudo easy_install pip
# Upgrade pip to the latest version
sudo pip install --upgrade pip
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
brew install bash # Install latest version of Bash.
brew install shellcheck  # Linter for shell scripts
# Configure the new version to be default
# Source: https://github.com/mathiasbynens/dotfiles/issues/544#issuecomment-104935642
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# This requires password and won't work on Travis CI
# Source: https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
if test ! ${CI}; then
    chsh -s /usr/local/bin/bash
fi
brew install htop

# Install pyenv
brew install pyenv

# Install Docker.
brew install docker

# Fix:
# https://stackoverflow.com/questions/19215590/why-cant-i-install-any-gems-on-my-mac
brew tap raggi/ale && brew install openssl-osx-ca
# Useful OS X softwares.
brew cask install google-chrome 
# Great tool but the cask has been deleted - https://github.com/JadenGeller/Helium/issues/207
# brew cask install jadengeller-helium  # Web browser on top of all other windows
brew cask install iterm2

# Install fonts.
brew tap caskroom/fonts
fonts=(
    font-source-code-pro
    font-roboto
)
echo "Installing fonts..."
brew cask install ${fonts[@]}

brew cleanup
