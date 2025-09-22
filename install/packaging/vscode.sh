#!/bin/zsh

INSTALLED_EXTENSIONS=$(code --list-extensions)

if [[ $INSTALLED_EXTENSIONS != *"github.copilot"* ]]; then
    code --install-extension github.copilot
fi

if [[ $INSTALLED_EXTENSIONS != *"github.copilot-chat"* ]]; then
    code --install-extension github.copilot
fi
