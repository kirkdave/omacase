#!/usr/bin/env bash

mkdir -p $HOME/.config
cp -R $HOME/.local/share/omacase/config/* $HOME/.config/

cp $HOME/.local/share/omacase/default/zshrc $HOME/.zshrc

ln -snf $HOME/.config/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
