setopt PROMPT_SUBST

export EDITOR=nvim
bindkey -v

alias vi='nvim'

export GOPATH="$HOME/.go"
export PATH="$HOME/.local/bin:$HOME/.go/bin:$HOME/.npm-global/bin:$PATH"

fpath=("$HOME/.config/zsh/completion" $fpath)

autoload -Uz compinit
compinit
autoload -U +X bashcompinit
bashcompinit

complete -o nospace -C /Users/ixidod/.local/bin/terraform terraform
autoload -Uz vcs_info

PROMPT='%n@%m %~ %# '
