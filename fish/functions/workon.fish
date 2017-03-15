# poor mans workon

function workon
  if test -z "$WORKON"
    echo "Please set \$WORKON env variable."
    return 1
  end

  if test (count $argv) -lt 1
    echo "Please provide a name for the virtualenv."
    return 1
  end

  set -l venv $argv[1]

  if not test -d $WORKON/$venv
    echo "No such virtualenv: $venv"
    return 1
  end

  source ~/.virtualenvs/$venv/bin/activate.fish
end
