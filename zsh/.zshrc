setopt PROMPT_SUBST

export EDITOR=nvim
bindkey -v

alias vi='nvim'
export GOPATH="$HOME/.go"
export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.go/bin:$PATH"

fpath=("$HOME/.config/zsh/completion" $fpath)

autoload -Uz compinit
compinit
autoload -U +X bashcompinit
bashcompinit


PROMPT='%n@%m %~ %# '
