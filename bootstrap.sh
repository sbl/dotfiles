#!/bin/sh

set -e

mkdir -p $HOME/.config/fish
mkdir -p $HOME/.config/nvim

stow -v2 --ignore 'fishd.*' -t $HOME/.config/fish fish
stow -v2 -t $HOME/.config/nvim nvim
stow -v2 -t $HOME misc
