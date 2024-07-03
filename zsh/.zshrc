bindkey -v
alias vi='nvim'

export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=/Users/iota/.go
export PATH=$GOPATH/bin:$PATH

fpath=(/opt/homebrew/share/zsh/site-functions \\$fpath)

autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
