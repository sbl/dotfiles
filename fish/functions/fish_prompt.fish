set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_char_stateseparator '|'

function _pwd_with_tilde
  echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|'
end

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo green
  else
    echo red
  end
end

function fish_prompt
  set -l last_status $status

  if set -q VIRTUAL_ENV
    echo -n -s  "(" (basename "$VIRTUAL_ENV") ")"
  end

  _print_in_color "\n"(_pwd_with_tilde) blue
  _print_in_color "\n♩ " (_prompt_color_for_status $last_status)
  printf '%s ' (__fish_git_prompt)
end
