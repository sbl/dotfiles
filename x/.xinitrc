#!/bin/sh

#
# ~/.xinitrc
#

# Load a resource file, and merge with the current settings.
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Ensure that the scripts in /etc/X11/xinit/xinitrc.d are sourced
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xsetroot -solid '#93a1a1'
feh --bg-scale ~/desktop.jpg
setxkmap -layout us,de

export TERMINAL=termite
exec i3
