#!/bin/zsh

mkdir -p $HOME/.config/omacase/themes
for t in $HOME/.local/share/omacase/themes/*; do ln -nfs "$t" $HOME/.config/omacase/themes/; done

# Set the initial theme
mkdir -p $HOME/.config/omacase/current
ln -snf $HOME/.config/omacase/themes/catppuccin $HOME/.config/omacase/current/theme
$HOME/.local/share/omacase/bin/omacase-theme-bg-next

# Set specific app themes
ln -snf $HOME/.config/omacase/current/theme/neovim.lua $HOME/.config/nvim/lua/plugins/theme.lua
ln -snf $HOME/.config/omacase/current/theme/ghostty $HOME/.config/ghostty/theme
