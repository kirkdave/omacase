#!/usr/bin/env zsh

echo -e "Installing Ruby and critical gems..."
mise use --global ruby@3.4
mise x ruby -- gem install bundler rails --no-document

echo -e "Installing NodeJS and critical packages..."
mise use --global node@22
mise x node -- npm install --global npm@11.1.0 pnpm yarn
