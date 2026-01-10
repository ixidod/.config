bindkey -v
alias vi='nvim'
typeset -U path fpath  
path=("$HOME/usr/local/go/bin" "$HOME/.local/bin" "$HOME/.go/bin" $path)
fpath=("$HOME/.config/zsh/completion" $fpath)
export GOPATH="$HOME/.go"
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
