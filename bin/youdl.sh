#!/bin/sh

# download sound from youtube files

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <youtube url> <name>"
    exit
fi

url=$1
name=$2

audio=$(youtube-dl -F $url | grep audio | tail -n 1)
num=$(echo $audio | cut -d ' ' -f1)
format=$(echo $audio | cut -d ' ' -f2)

youtube-dl $url -f $num -o "$name.$format"
