setopt PROMPT_SUBST

export EDITOR=nvim
bindkey -v

alias vi='nvim'

export PATH="$HOME/.local/bin:$HOME/.go/bin:$PATH"

fpath=("$HOME/.config/zsh/completion" $fpath)

autoload -Uz compinit
compinit

PROMPT='%n@%m %~ %# '
