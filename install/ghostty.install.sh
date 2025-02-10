echo -e "Setting Ghostty configuration..."

mkdir -p $HOME/.config/ghostty

cp configs/ghostty/config $HOME/.config/ghostty/config
cp -r configs/ghostty/themes/ $HOME/.config/ghostty/themes
