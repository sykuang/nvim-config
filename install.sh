#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if command -v nvim &> /dev/null
then
  if [[ ! -d  $HOME/.config/nvim ]];then
    git clone https://github.com/NvChad/NvChad ~/.config/nvim
  fi
  rm -rf ~/.config/nvim/lua/custom 
  ln -s $SCRIPT_PATH/custom ~/.config/nvim/lua/custom
  nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
fi
