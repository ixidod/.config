bindkey -v
alias vi='nvim'
export EDITOR='nvim'
export VISUAL='nvim'

export GOPATH="$HOME/.go" 

typeset -U path
path=(
  "$HOME/usr/local/go/bin"
  "$HOME/.local/bin"
  "$GOPATH/bin"
  $path
)

typeset -U fpath
fpath=("$HOME/.config/zsh/completion" $fpath)

autoload -Uz compinit
compinit

autoload -Uz bashcompinit
bashcompinit

