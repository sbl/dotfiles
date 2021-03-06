# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

#set -x CTEST_OUTPUT_ON_FAILURE 1
set -x CMAKE_EXPORT_COMPILE_COMMANDS 1

# LLVM
#set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
#set -gx CPPFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/include"

# path
# instead of setting paths via configs (less portable) use fish_user_paths
# http://fishshell.com/docs/current/tutorial.html#tut_path
# > set -U fish_user_paths /usr/local/bin $fish_user_paths

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'

alias vim=nvim
alias vi=nvim
