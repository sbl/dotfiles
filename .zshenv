#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Go
#

export GOPATH=$HOME


#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

path=(
  $HOME/.pyenv/bin
  $GOPATH/bin
  #~/google-cloud-sdk/platform/google_appengine
  ~/.local/bin
  /usr/local/{bin,sbin}
  $path
)

