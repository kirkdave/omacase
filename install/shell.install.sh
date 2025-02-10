echo -e "Configuring the shell environment..."

[[ -f "$HOME/.zshrc" ]] && cp $HOME/.zshrc $HOME/.zshrc.pre-omacase
[[ -f "$HOME/.zprofile" ]] && cp $HOME/.zprofile $HOME/.zprofile.pre-omacase
[[ -f "$HOME"/.p10k.zsh ]] && cp $HOME/.p10k.zsh $HOME/.p10k.zsh.pre-omacase

cp configs/shell/zshrc $HOME/.zshrc
cp configs/shell/p10k.zsh $HOME/.p10k.zsh
