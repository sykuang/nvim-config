#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [[ -d  ~/.config/nvim ]];then
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
fi
ln -s "$SCRIPT_PATH" ~/.config/nvim/
