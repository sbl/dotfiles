function brew_clean_with_deps
  set dep $argv
  set deps (join (brew leaves | psub) (brew deps $dep | psub))
  if test -n "$deps"
    brew uninstall $deps
  end
  brew uninstall $dep
end
