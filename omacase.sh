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

TPM_DIR=$HOME/.config/tmux/plugins/tpm
if [ ! -d "$TPM_DIR" ]; then
	echo -e "Installing Tmux Plugin Manager (TPM)..."
	git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi

echo "TPM installed successfully!"
echo "Now opening tmux session and installing plugins..."

tmux new-session -d -s tpm_install_session
tmux send-keys -t tpm_install_session C-s "I" C-m
tmux kill-session -t tpm_install_session

source install-languages.sh

echo -e "Applying macOS settings..."
cutler apply

exit 0
