#!/usr/bin/env bash

mkdir -p $HOME/.config
cp -R $HOME/.local/share/omacase/config/* $HOME/.config/

cp $HOME/.local/share/omacase/default/zshrc $HOME/.zshrc
