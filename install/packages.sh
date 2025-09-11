#!/usr/bin/env bash

echo -e "Installing CLI packages..."
brew bundle --quiet --file $HOME/.local/share/omacase/install/Brewfile.cli

echo -e "Installing GUI applications..."
brew bundle --quiet --file $HOME/.local/share/omacase/install/Brewfile.casks

echo -e "Installing Fonts..."
brew bundle --quiet --file $HOME/.local/share/omacase/install/Brewfile.fonts

