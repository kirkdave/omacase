#!/usr/bin/env zsh
set -euo pipefail

install() {
	clear
	echo

	# Usage:
	# section "Section heading..."
	section() {
		echo -e "\n===> $1"
	}

	section "Sudo permission required for setup..."
	sudo echo "Sudo granted"

	# We use Homebrew for package management. If it's not there, install it
	if ! command -v brew &> /dev/null; then
		section "Installing Homebrew..."
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
		eval "$(/opt/homebrew/bin/brew shellenv zsh)"
		brew install --yes git
	fi

	section "Installing packages..."
	/opt/homebrew/bin/brew bundle install --file ./brewfile.packages

	section "Installing applicaitons..."
    	local custom_ca_path="$HOME/.custom-ca-certificates.pem"
	if [[ -f "$custom_ca_path" ]]; then
    		echo "There are custom CA certs"
    		grep -qxF "ENV[\"NODE_EXTRA_CA_CERTS\"] = \"$custom_ca_path\"" ./brewfile.applicaitons || echo "ENV[\"NODE_EXTRA_CA_CERTS\"] = \"$custom_ca_path\"" >> ./brewfile.applicaitons
	fi
	/opt/homebrew/bin/brew bundle install --file ./brewfile.applicaitons

	section "Configuring applications & packages..."
	mkdir -p "$HOME/.config"
	cp -rf "./config/"* "$HOME/.config/"
	for dir in "./config"/*/; do
		echo "$(basename "$dir")"
	done

	section "Setting up the shell..."
	cat >"$HOME/.zshrc" <<'EOF'
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Load zsh options, keybindings and completions
source ~/.config/shell/zoptions

# Load shared shell configuration
source ~/.config/shell/all
EOF
	echo 'source ~/.zshrc' >"$HOME/.zprofile"

	section "Installing dev environments..."
	selected_langs=$(gum choose --no-limit --height=15 \
		--selected="node" --selected="ruby" \
		"node" "ruby" "python" "go" "rust" "java" "php" "elixir" "deno" "bun" "zig")
	while IFS= read -r lang; do
		[[ -n "$lang" ]] && mise use -g "$lang" || true
	done <<< "$selected_langs"
}

# Use a function call to prevent brew installs from stealing stdin
install
