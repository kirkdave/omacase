#!/usr/bin/env bash

if ! command -v gum &>/dev/null; then
  HOMEBREW_NO_ENV_HINTS=1 brew install --quiet gum
fi

export OMACASE_USER_NAME=$(gum input --prompt "What's your name? (used as default author name in git commits) ")
export OMACASE_USER_EMAIL=$(gum input --prompt "What's your email address? (used as default author email in git commits) ")
