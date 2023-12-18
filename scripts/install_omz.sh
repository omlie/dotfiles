#!/bin/bash
set -e

if ! [[ -d ~/.oh-my-zsh ]]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#check if ~/.zshrc exists
# if it does, remove it
if [[ -f $HOME/.zshrc ]]; then
  rm $HOME/.zshrc
fi

rm -rf $HOME/.zshrc

if [[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10 ]]; then
  echo "Installing p10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi