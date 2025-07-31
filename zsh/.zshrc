export ZSH="$HOME/.oh-my-zsh"

DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  # python         # Python section
  # golang         # Go section
  # haskell        # Haskell Stack section
  lua            # Lua section
  # docker         # Docker section
  # docker_compose # Docker section
  venv           # virtualenv section
  conda          # conda virtualenv section
  uv             # uv section
  # kubectl        # Kubectl context section
  # ansible        # Ansible section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  battery        # Battery level and status
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

plugins=(
  git
  fzf
  brew
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

# init zoxide, replace `cd`
_evalcache zoxide init --cmd cd zsh
