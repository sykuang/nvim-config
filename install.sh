#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails
set -o pipefail

REPO_URL="https://github.com/sykuang/nvim-config.git"
DEFAULT_CLONE_PATH="$HOME/nvim-config"
NVIM_CONFIG_PATH="$HOME/.config/nvim"
COPILOT_HOME="${COPILOT_HOME:-$HOME/.copilot}"
COPILOT_HOOK_PATH="$COPILOT_HOME/hooks/nvim-copilot-status.json"

# Detect whether we're being run from a local checkout or piped from curl.
# When piped (e.g. `curl ... | bash`), $0 is "bash" and there is no script file,
# so we clone the repo to a default location first.
SOURCE="${BASH_SOURCE[0]:-}"
if [ -n "$SOURCE" ] && [ -f "$SOURCE" ]; then
    SCRIPT_PATH="$( cd -- "$(dirname "$SOURCE")" >/dev/null 2>&1 ; pwd -P )"
else
    if ! command -v git >/dev/null 2>&1; then
        echo "git is required to install from a remote URL. Please install git and retry." >&2
        exit 1
    fi
    if [ ! -d "$DEFAULT_CLONE_PATH" ]; then
        echo "Cloning $REPO_URL to $DEFAULT_CLONE_PATH"
        git clone "$REPO_URL" "$DEFAULT_CLONE_PATH"
    else
        echo "Repository already exists at $DEFAULT_CLONE_PATH, skipping clone."
    fi
    SCRIPT_PATH="$DEFAULT_CLONE_PATH"
fi

mkdir -p "$(dirname "$NVIM_CONFIG_PATH")"

if [ -e "$NVIM_CONFIG_PATH" ] || [ -L "$NVIM_CONFIG_PATH" ]; then
    echo "$NVIM_CONFIG_PATH already exists, skipping symlink creation."
else
    ln -s "$SCRIPT_PATH/" "$NVIM_CONFIG_PATH"
    echo "Symlinked $NVIM_CONFIG_PATH -> $SCRIPT_PATH"
fi

mkdir -p "$COPILOT_HOME/hooks"

if [ -e "$COPILOT_HOOK_PATH" ] || [ -L "$COPILOT_HOOK_PATH" ]; then
    echo "$COPILOT_HOOK_PATH already exists, skipping symlink creation."
else
    ln -s "$SCRIPT_PATH/.github/hooks/nvim-copilot-status.json" "$COPILOT_HOOK_PATH"
    echo "Symlinked $COPILOT_HOOK_PATH -> $SCRIPT_PATH/.github/hooks/nvim-copilot-status.json"
fi
