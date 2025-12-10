setopt PROMPT_SUBST

export EDITOR=nvim
bindkey -v

alias vi='nvim'

fpath=("$HOME/.config/zsh/completion" $fpath)

autoload -Uz compinit
compinit
autoload -U +X bashcompinit
bashcompinit


autoload -Uz vcs_info
precmd_functions+=(vcs_info)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '
PROMPT='%n@%m %~ ${vcs_info_msg_0_}%# '
