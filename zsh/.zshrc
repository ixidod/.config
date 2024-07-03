export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=/Users/iota/.go
export PATH=$GOPATH/bin:$PATH

fpath=(/opt/homebrew/share/zsh/site-functions \\$fpath)
autoload -U compinit; compinit

alias vi='nvim'

autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{153}%b%f'

PROMPT='%(?.%F{green}●.%F{red}●%f) %F{211}%1~%f ${vcs_info_msg_0_} '





autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
