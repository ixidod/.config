bindkey -v
alias vi='nvim'
setopt NO_CASE_GLOB
source <(fzf --zsh)

export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=/Users/iota/.go
export PATH=$GOPATH/bin:$PATH

fpath=(/opt/homebrew/share/zsh/site-functions \\$fpath)



autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit

source /opt/homebrew/etc/bash_completion.d/az
eval "$(/opt/homebrew/bin/brew shellenv)"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
complete -o nospace -C /opt/homebrew/bin/terraform terraform
