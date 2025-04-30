#!/usr/bin/env zsh

OMACASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure Homebrew is installed
if [ ! -f /opt/homebrew/bin/brew ]; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontnet.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure Homebrew is on the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --file $OMACASE_DIR/Brewfile

echo -e "Syncing dotfiles to $HOME..."
cd $OMACASE_DIR/dotfiles
stow . --target $HOME --adopt
cd $OMACASE_DIR

echo -e "Applying macOS settings..."
cutler apply

