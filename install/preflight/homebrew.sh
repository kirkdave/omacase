#!/usr/bin/env bash

if [ ! -f /opt/homebrew/bin/brew ]; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure Homebrew is on the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
