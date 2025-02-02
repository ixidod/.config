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

fpath=(/opt/homebrew/share/zsh/site-functions \\$fpath)



autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit

source /opt/homebrew/etc/bash_completion.d/az
eval "$(/opt/homebrew/bin/brew shellenv)"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source <(fzf --zsh)
complete -o nospace -C /opt/homebrew/bin/terraform terraform
