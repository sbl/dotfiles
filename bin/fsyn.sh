#!/bin/sh

# a wrapper for fluidsynth to use the musescore provided soundfont

set -e

sfz="/Applications/MuseScore 3.5.app/Contents/Resources/sound/MuseScore_General.sf2"

fluidsynth "$sfz" "$@"
