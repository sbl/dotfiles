# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# path
# instead of setting paths via configs (less portable) use fish_user_paths
# http://fishshell.com/docs/current/tutorial.html#tut_path
# > set -U fish_user_paths /usr/local/bin $fish_user_paths

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'
alias vi=nvim
alias vim=nvim

# OPAM configuration
source /Users/stephen/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
