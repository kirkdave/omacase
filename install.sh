#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -eE

OMACASE_PATH="$HOME/.local/share/omacase"
OMACASE_INSTALL="$OMACASE_PATH/install"

export PATH="$OMACASE_PATH/bin:$PATH"

# Preflight
echo -e "Starting Preflight checks and steps..."
source $OMACASE_INSTALL/preflight/trap-errors.sh
source $OMACASE_INSTALL/preflight/homebrew.sh
source $OMACASE_INSTALL/preflight/user-choices.sh
source $OMACASE_INSTALL/preflight/show-env.sh

# Packaging
source $OMACASE_INSTALL/packages.sh
source $OMACASE_INSTALL/packaging/lazyvim.sh

# Configuration
source $OMACASE_INSTALL/config/config.sh
source $OMACASE_INSTALL/config/theme.sh
source $OMACASE_INSTALL/config/git.sh
source $OMACASE_INSTALL/config/home.sh
source $OMACASE_INSTALL/config/dock.sh
source $OMACASE_INSTALL/config/finder.sh
source $OMACASE_INSTALL/config/screencapture.sh
