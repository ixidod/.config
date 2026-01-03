setopt PROMPT_SUBST

export EDITOR=nvim
bindkey -v

alias vi='nvim'
export GOPATH="$HOME/.go"
export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.go/bin:$PATH"

fpath=("$HOME/.config/zsh/completion" $fpath)

source <(npm completion)
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(gh completion -s zsh)
source <(kind completion zsh)
source <(podman completion zsh)
source <(minikube completion zsh)
source <(claude completion zsh)

autoload -Uz compinit
compinit
autoload -U +X bashcompinit
bashcompinit

PROMPT='%n@%m %~ %# '
