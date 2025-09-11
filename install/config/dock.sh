#!/bin/zsh

defaults write com.apple.dock "tilesize" -int "22"
defaults write com.apple.dock "largesize" -int "62"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float "0.0"
defaults write com.apple.dock "autohide-time-modifier" -float "0.6"
defaults write com.apple.dock "show-recents" -bool "true"
defaults write com.apple.dock "static-only" -bool "true"
defaults write com.apple.dock "mineffect" -string "scale"

killall Dock
