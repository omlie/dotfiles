#!/bin/bash
set -e

if test ! $(which brew); then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Updating Homebrew"
brew update
echo "Homebrew is installing apps"
brew bundle --file=~/dotfiles/Brewfile
