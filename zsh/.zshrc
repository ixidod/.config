bindkey -v
alias vi='nvim'

export COLORTERM=truecolor
eval "$(/opt/homebrew/bin/brew shellenv)"
typeset -U path fpath

export GOPATH="$HOME/.go"
path=("/usr/local/go/bin" "$HOME/.local/bin" "$HOME/.go/bin" $path)
fpath=("$HOME/.config/zsh/completion" $fpath)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

git_prompt() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ -z $b ]] && return
  local git_status indicators=""
  git_status=$(git status --porcelain 2>/dev/null)
  grep -q '^[MADRC]' <<< "$git_status" && indicators+="+"
  grep -q '^.[MD]'   <<< "$git_status" && indicators+="*"
  grep -q '^??'      <<< "$git_status" && indicators+="?"
  print "($b${indicators:+ $indicators}) "
}
setopt PROMPT_SUBST
PROMPT='%n@%m [%1~] $(git_prompt)%# '
