#!/usr/bin/env bash

echo -e "Configuring Git..."
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global pull.rebase true

git config --global init.defaultBranch main

# Set user.name if non-empty after trimming whitespace
trim_ws() { printf '%s' "$1" | tr -d '[:space:]'; }

if [[ -n "$(trim_ws "${OMACASE_USER_NAME-}")" ]]; then
  git config --global user.name "${OMACASE_USER_NAME}"
fi

if [[ -n "$(trim_ws "${OMACASE_USER_EMAIL-}")" ]]; then
  git config --global user.email "${OMACASE_USER_EMAIL}"
fi
