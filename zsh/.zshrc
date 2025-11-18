export EDITOR=nvim
bindkey -v

alias nvim-update='for d in /Users/iota/.local/share/nvim/site/pack/plugins/start/*/.git; do (cd "${d%/.git}" && echo "Updating $(basename "$PWD")" && git pull --ff-only); done'

alias vi='nvim'
setopt NO_CASE_GLOB
source <(fzf --zsh)

export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=/Users/iota/.go
export PATH=$GOPATH/bin:$PATH

fpath=(/opt/homebrew/share/zsh/site-functions \\$fpath)
autoload -U +X bashcompinit && bashcompinit

eval "$(/opt/homebrew/bin/brew shellenv)"
complete -o nospace -C /opt/homebrew/bin/terraform terraform

autoload -Uz compinit
compinit
