echo -e "Configuring Tmux..."

mkdir -p $HOME/.config/tmux

if [ ! -d $HOME/.config/tmux/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/tpm
fi

cp configs/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
