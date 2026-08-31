# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  fzf
  brew
  docker
  kubectl
  autoupdate
  evalcache
  autoswitch_virtualenv
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# renew autocompletion once a day only
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

source $ZSH/oh-my-zsh.sh

#######################
# User configurations #
#######################

## BINDS

# emacs style for history-substring-search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

## ALIASES

# nvim
alias vim="nvim"
alias vimdiff='nvim -d'
alias cat='bat --paging=never'

## EXPORTS

# history
export HISTSIZE=5000
export SAVEHIST=5000
export HISTDUP=erase
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# nvim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# gpg
export GPG_TTY=$TTY

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/.ignore -g ""'

# go
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# haskell
# [ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
# export PATH="$HOME/.local/bin:$PATH"

## MISC

# init pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
_evalcache pyenv init - zsh
_evalcache pyenv virtualenv-init - zsh

# init zoxide, replace `cd`
_evalcache zoxide init --cmd cd zsh

# tls fix for opencode
export NODE_EXTRA_CA_CERTS=$HOME/Documents/certs/RootCA.crt

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
