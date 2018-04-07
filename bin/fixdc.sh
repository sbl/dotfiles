#!/usr/bin/env bash

# a tool that remove DC offset from a file. used for the ouputs of samplernn,
# which mostly have DC issues.

set -e

usage() {
  echo "$0 [filenames]"
}

if [ ! -e "$1" ]; then
  usage
  exit 1
fi

for file in "$@"
do
  echo "fixing $file"
  dc=$(sox $file -n stats 2>&1 | head -1 | cut -d ' ' -f5)
  sox $file "${file%.*}_cleaned.wav" dcshift -$dc highpass 10
done
