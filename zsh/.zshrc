bindkey -v
alias vi='nvim'

export COLORTERM=truecolor

typeset -U path fpath  

source "$HOME/.local/share/google-cloud-sdk/path.zsh.inc"
source "$HOME/.local/share/google-cloud-sdk/completion.zsh.inc"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export GOPATH="$HOME/.go"
path=("/usr/local/go/bin" "$HOME/.local/bin" "$HOME/.go/bin" $path)
fpath=("$HOME/.config/zsh/completion" $fpath)

export PATH="/Applications/SnowflakeCLI.app/Contents/MacOS:$PATH"

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
