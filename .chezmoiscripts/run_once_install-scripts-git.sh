#!/bin/bash
set -euo pipefail

DEV_PROJECTS_DIR="$HOME/Projects"
SCRIPT_REPO_DIR="$DEV_PROJECTS_DIR/custom-scripts"
SCRIPT_REPO_URL="https://github.com/Shrub24/custom-scripts.git"
DEFAULT_BRANCH="main"

if [ ! -d "$SCRIPT_REPO_DIR/.git" ]; then
    echo "Cloning dev scripts into $SCRIPT_REPO_DIR..."
    git clone --branch "$DEFAULT_BRANCH" "$SCRIPT_REPO_URL" "$SCRIPT_REPO_DIR"
else
    echo "Dev scripts directory already exists. Skipping clone."
fi

INSTALL_SCRIPT="$SCRIPT_REPO_DIR/install.sh"
if [ -f "$INSTALL_SCRIPT" ]; then
    echo "Running the script package installer..."
    bash "$INSTALL_SCRIPT"
else
    echo "Warning: Could not find installer at $INSTALL_SCRIPT"
fi