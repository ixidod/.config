bindkey -v
alias vi='nvim'
typeset -U path fpath  
export GOPATH="$HOME/.go"
path=("$HOME/usr/local/go/bin" "$HOME/.local/bin" "$HOME/.go/bin" $path)
fpath=("$HOME/.config/zsh/completion" $fpath)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
