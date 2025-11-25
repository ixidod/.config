# vim: ft=zsh

# --- PYTHON ---
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"

if [ -d "$PYENV_ROOT/bin" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

if [ -d "$PYENV_ROOT/shims" ]; then
  export PATH="$PYENV_ROOT/shims:$PATH"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# --- NO CASE ===
setopt NO_CASE_GLOB
setopt PROMPT_SUBST

# --- Editor / Keybindings ---
export EDITOR=nvim
bindkey -v

# --- Aliases ---
alias vi='nvim'

# ---Update all plugin Git repos---
alias nvim-update='for d in $HOME/.local/share/nvim/site/pack/plugins/start/*/.git; do (cd "${d%/.git}" && echo "Updating $(basename "$PWD")" && git pull --ff-only); done'

# --- PATH ---
export PATH="/opt/homebrew/bin:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"
export PATH="/Applications/SnowflakeCLI.app/Contents/MacOS/:$PATH"

# --- Homebrew environment (must come BEFORE compinit) ---
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- fzf ---
source <(fzf --zsh)

# --- Completion paths ---
fpath=("$HOME/.config/zsh/completion" $fpath)

# --- Completion system ---
autoload -Uz compinit
compinit

# Load bash-style completion ONLY for tools that require it (terraform)
autoload -U +X bashcompinit
bashcompinit

# Terraform completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# --- Git prompt via vcs_info ---
autoload -Uz vcs_info
precmd_functions+=(vcs_info)

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '

PROMPT='%n@%m %~ ${vcs_info_msg_0_}%# '
