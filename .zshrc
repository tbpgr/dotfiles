#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# execute configs
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

alias cc='clear'
alias pcd='cd $(find . -maxdepth 1 -type d | peco)'
alias baskup_todos='ruby /Users/tbpgr/todos/bakup_daily.rb'
function git(){hub "$@"}
bindkey '^@' gcd

