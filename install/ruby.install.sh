echo -e "Installing Ruby and critical gems..."
mise use --global ruby@3.4

mise x ruby -- gem install bundler rails --no-document

