# poor mans mkvirtualenv

function mkvirtualenv
  if test -z "$WORKON"
    echo "Please set \$WORKON env variable."
    return 1
  end

  if test (count $argv) -lt 1
    echo "Please provide a name for the virtualenv."
    return 1
  end

  set -l venv $argv[1]

  # we use py3
  python3 -mvenv $WORKON/$venv
  echo "Virtualenv $venv created."

  workon $venv
end
