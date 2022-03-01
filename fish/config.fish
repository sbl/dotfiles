# environment variables

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x GOPATH $HOME

set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less

set -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

set -x CTEST_OUTPUT_ON_FAILURE 1
set -x CMAKE_EXPORT_COMPILE_COMMANDS 1

set -x AWS_CREDENTIALS_PATH $HOME/.phrase/config.json

# LLVM
if test "arm64" = (uname -m)
  set -pgx LDFLAGS "-L/opt/homebrew/lib -L/usr/local/lib"
  set -pgx CPPFLAGS "-I/opt/homebrew/include -I/usr/local/include"
  set -pgx CFLAGS "-I/opt/homebrew/include -I/usr/local/include"

  set -gx CPATH /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include

  set -pgx LDFLAGS "-L/opt/homebrew/opt/python@3.10/lib"
  set -pgx PKG_CONFIG_PATH "/opt/homebrew/opt/python@3.10/lib/pkgconfig"
else
  set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
  set -gx LDFLAGS "-L/usr/local/lib"
  set -gx CPPFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/include"
  set -gx CFLAGS "-I/usr/local/opt/llvm/include -I/usr/local/include"
  set -gx CPATH /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include
end

# rbenv
#status --is-interactive; and source (rbenv init -|psub)

# key bindings

bind \ee accept-autosuggestion # ctrl-e completes first suggestion

# aliases

alias l='ls -lFh'
alias ll='ls -alF'

alias vim=nvim
alias vi=nvim
