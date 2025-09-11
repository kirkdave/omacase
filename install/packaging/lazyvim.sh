#!/usr/bin/env bash

if [[ ! -d "$HOME/.config/nvim" ]]; then
  echo -e "Installing LazyVim..."
  git clone https://github.com/LazyVim/starter $HOME/.config/nvim
  cp -R $HOME/.local/share/omacase/config/nvim/* $HOME/.config/nvim/
  rm -rf $HOME/.config/nvim/.git
fi
