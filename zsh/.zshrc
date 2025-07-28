export EDITOR=nvim
bindkey -v

alias vi='nvim'
alias k="kubectl"
alias kgp="kubectl get pods"
setopt NO_CASE_GLOB
source <(fzf --zsh)

export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=/Users/iota/.go
export PATH=$GOPATH/bin:$PATH

export DOCKER_DEFAULT_PLATFORM=linux/amd64

source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

fpath=(/opt/homebrew/share/zsh/site-functions \\$fpath)
autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit

eval "$(/opt/homebrew/bin/brew shellenv)"
source <(fzf --zsh)
complete -o nospace -C /opt/homebrew/bin/terraform terraform
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/iota/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
