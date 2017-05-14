function lsvirtualenv
  if test -z "$WORKON"
    echo "Please set \$WORKON env variable."
    return 1
  end

  ls -l $WORKON
end
