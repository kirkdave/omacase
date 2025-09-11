#!/bin/zsh

defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
defaults write com.apple.screencapture "target" -string "clipboard"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

killall Finder
