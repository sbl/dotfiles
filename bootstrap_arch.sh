#!/bin/sh

set -e

mkdir -p $HOME/.config/{fish,nvim,i3,polybar,terminator,fontconfig}

stow -vv -t $HOME/.config/fish fish
stow -vv -t $HOME/.config/nvim nvim
stow -vv -t $HOME/.config/i3 i3
stow -vv -t $HOME/.config/polybar polybar
stow -vv -t $HOME/.config/terminator terminator
stow -vv -t $HOME/.config/fontconfig fontconfig
stow -vv -t $HOME x
stow -vv -t $HOME misc
