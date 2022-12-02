function brew_clean_with_deps
  set dep $argv
  set deps (join (brew leaves | psub) (brew deps $dep | psub))
  brew uninstall $dep

  if test -n "$deps"
    brew uninstall $deps
  end
end
