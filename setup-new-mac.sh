#!/bin/bash
set -e

scripts/install_homebrew.sh
scripts/install_omz.sh

# echo "Git config"

#git config --global user.name "Ole Magnus Lie"
#git config --global user.email lieolemagnus@gmail.com

echo "Symlinking dotfiles"
./symlink-dotfiles.sh

echo "Setting ZSH as shell..."
chsh -s /bin/zsh
source ~/.zshrc

./scripts/set_mac_settings.sh

echo "Done!"
