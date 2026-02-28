bindkey -v
alias vi='nvim'
export COLORTERM=truecolor
typeset -U path fpath  

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export TERM=xterm-256color

eval "$(pyenv init -)"

export GOPATH="$HOME/.go"
path=("/usr/local/go/bin" "$HOME/.local/bin" "$HOME/.go/bin" $path)
fpath=("$HOME/.config/zsh/completion" $fpath)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

[[ -f "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
