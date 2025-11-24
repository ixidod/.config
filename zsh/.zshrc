# --- PYTHON ---
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# --- NO CASE ===
setopt NO_CASE_GLOB
setopt PROMPT_SUBST

# --- Editor / Keybindings ---
export EDITOR=nvim
bindkey -v

# --- Aliases ---
alias vi='nvim'
alias snowsql="/Applications/SnowSQL.app/Contents/MacOS/snowsql"

# ---Update all plugin Git repos---
alias nvim-update='for d in $HOME/.local/share/nvim/site/pack/plugins/start/*/.git; do (cd "${d%/.git}" && echo "Updating $(basename "$PWD")" && git pull --ff-only); done'

# --- PATH ---
export PATH="/opt/homebrew/bin:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# --- Homebrew environment (must come BEFORE compinit) ---
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- fzf ---
source <(fzf --zsh)

# --- Completion paths ---
ZSH_COMPLETION_DIR="$HOME/.config/zsh/completions"
mkdir -p "$ZSH_COMPLETION_DIR"
fpath=("$ZSH_COMPLETION_DIR" $fpath)

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
