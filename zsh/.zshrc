setopt PROMPT_SUBST

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export EDITOR=nvim
bindkey -v

alias vi='nvim'

export PATH="/opt/homebrew/bin:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
fpath=("$HOME/.config/zsh/completion" $fpath)

autoload -Uz compinit
compinit
autoload -U +X bashcompinit
bashcompinit

complete -o nospace -C /opt/homebrew/bin/terraform terraform

autoload -Uz vcs_info
precmd_functions+=(vcs_info)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '
PROMPT='%n@%m %~ ${vcs_info_msg_0_}%# '
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/iota/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
