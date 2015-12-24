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

alias cc='clear'
alias pcd='cd $(find . -maxdepth 1 -type d | peco)'
alias backup_todos='ruby /Users/tbpgr/todos/bakup_daily.rb'
function git(){hub "$@"}
bindkey '^@' gcd
set -o vi
bindkey "^R" history-incremental-search-backward

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
        source /usr/local/bin/virtualenvwrapper.sh
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

