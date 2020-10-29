export ZSH="/home/pbr/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# Functional alias
alias ghci='stack ghci'
alias ghc='stack ghc'
alias p='sudo pacman'
alias cat='bat'
alias st='speed-test'
alias meteo=weather
alias dot='cd ~/.dotfiles'
alias ls='exa'
alias rservices='sudo systemctl list-units --type=service --state=running'
alias vim='nvim'
alias ts='tmux list-sessions'
alias tk='tmux kill-session -t'
alias ta='tmux attach -t'
alias tka='tmux kill-server'
alias help='tldr'
alias grep='grep --color=auto'

# Master's aliases
alias master='cd ~/Masters'
alias sonarqube='~/Downloads/sonarqube-8.5.1.38104/bin/linux-x86-64/sonar.sh console'
alias electrum='java -jar ~/Downloads/electrum-2.1.rc5.jar'


function weather() {
  curl 'wttr.in/~'${1:-Braga}'+'$2'?'${3:-0}
}

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#


#enable vim mode on commmand line
bindkey -v
export KEYTIMEOUT=1


# basic tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vim bindkeys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -a u undo
bindkey -a '^T' redo

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.





# Load spaceship prompt
autoload -U promptinit; promptinit
# prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  exit_code     # Exit code section
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  time          # Time stamps section
  host          # Hostname section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_PROMPT_ADDNEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

SPACESHIP_CHAR_SYMBOL=
SPACESHIP_CHAR_SYMBOL_ROOT='# '
SPACESHIP_CHAR_COLOR_SUCESS=white
SPACESHIP_CHAR_COLOR_FAILURE=white

SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_INSERT=
SPACESHIP_VI_MODE_NORMAL=[N]
SPACESHIP_VI_MODE_COLOR=yellow

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=yellow
SPACESHIP_TIME_FORMAT=%T

SPACESHIP_USER_PREFIX=
SPACESHIP_USER_COLOR=magenta
SPACESHIP_USER_SHOW=always

SPACESHIP_DIR_PREFIX=

SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_EXEC_TIME_SHOW=false
