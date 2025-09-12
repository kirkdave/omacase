if ! code --list-extensions | grep -Fx catppuccin.catppuccin-vsc &>/dev/null; then
  code --install-extension catppuccin.catppuccin-vsc
fi
TMP_SETTINGS=$(mktemp)
jq '."workbench.colorTheme" = "Catppuccin Mocha" | ."catppuccin.accentColor" = "blue"' $HOME/Library/Application\ Support/Code/User/settings.json >"$TMP_SETTINGS" &&
  mv "$TMP_SETTINGS" $HOME/Library/Application\ Support/Code/User/settings.json
