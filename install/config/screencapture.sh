#!/bin/zsh

defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
defaults write com.apple.screencapture "target" -string "clipboard"

killall SystemUIServer Finder
