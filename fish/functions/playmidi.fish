# simple fluidsynth wrapper
function playmidi
  set -l sfpath $HOME/Dropbox/audio/samples/sf2/MuseScore_General.sf2
  fluidsynth -i $sfpath $argv
end


