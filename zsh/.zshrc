
export EDITOR=nvim
bindkey -v

alias nvim-update='for d in /Users/iota/.local/share/nvim/site/pack/plugins/start/*/.git; do (cd "${d%/.git}" && echo "Updating $(basename "$PWD")" && git pull --ff-only); done'

alias vi='nvim'
alias k="kubectl"
alias kgp="kubectl get pods"
setopt NO_CASE_GLOB
source <(fzf --zsh)

export PATH="/opt/homebrew/bin:$PATH"
export GOPATH=/Users/iota/.go
export PATH=$GOPATH/bin:$PATH

export DOCKER_DEFAULT_PLATFORM=linux/amd64

#source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

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

# Minimal status: name, branch, ahead/behind, dirty; does NOT change your cwd
nvim-status() {
  ( setopt localoptions null_glob
    local roots=("$HOME/.local/share/nvim/site/pack"/*/start)
    for root in "${roots[@]}"; do
      for g in "$root"/*/.git(N); do
        (
          cd "${g%/.git}" || exit
          local plugin branch upstream default_branch behind ahead dirty
          plugin=${PWD##*/}
          branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
          upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
          if [[ -z "$upstream" ]]; then
            default_branch=$(git remote show origin 2>/dev/null | awk '/HEAD branch/ {print $NF}')
            [[ -z "$default_branch" ]] && default_branch=master
            upstream="origin/$default_branch"
          fi
          git fetch --quiet origin 2>/dev/null
          behind=$(git rev-list --count HEAD.."$upstream" 2>/dev/null)
          ahead=$(git rev-list --count "$upstream"..HEAD 2>/dev/null)
          git diff --quiet --ignore-submodules -- 2>/dev/null || dirty="*"
          printf "%-28s %-12s a:%-3s b:%-3s %s\n" \
            "$plugin" "${branch:-?}" "$ahead" "$behind" "$dirty"
        )
      done
    done
  )
}

# Only show plugins that are behind; also no cwd change
nvim-outdated() {
  ( setopt localoptions null_glob
    local roots=("$HOME/.local/share/nvim/site/pack"/*/start)
    for root in "${roots[@]}"; do
      for g in "$root"/*/.git(N); do
        (
          cd "${g%/.git}" || exit
          local plugin upstream default_branch behind
          plugin=${PWD##*/}
          upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
          if [[ -z "$upstream" ]]; then
            default_branch=$(git remote show origin 2>/dev/null | awk '/HEAD branch/ {print $NF}')
            [[ -z "$default_branch" ]] && default_branch=master
            upstream="origin/$default_branch"
          fi
          git fetch --quiet origin 2>/dev/null
          behind=$(git rev-list --count HEAD.."$upstream" 2>/dev/null)
          [[ "$behind" -gt 0 ]] && echo "$plugin is behind by $behind commit(s)"
        )
      done
    done
  )
}

