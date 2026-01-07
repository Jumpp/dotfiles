# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Ensure user-local bin dirs are on PATH so tools like `zoxide` are found.
# Add ~/.local/bin and ~/.cargo/bin early so `eval "$(zoxide init zsh)"` works.
if [[ -d "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi
if [[ -d "$HOME/.cargo/bin" ]]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi
export PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/juuso/.oh-my-zsh"
source "$HOME/apps/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

    # vim mode config
    # ---------------
MODE_CURSOR_VIINS="#8bc34a steady bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="#ff9800 block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
    # Activate vim mode. (actual enabling moved after oh-my-zsh loads)


ZSH_THEME="simple"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# History settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zsh-syntax-highlighting
plugins=(
    git
    yarn
    node
    web-search
    jsontools
    docker
    vi-mode
    zsh-autosuggestions
    common-aliases
    fasd
    zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh

# Enable vi keybindings after oh-my-zsh has loaded
bindkey -v
export KEYTIMEOUT=5

# zsh-syntax-highlighting: source if installed in custom plugins
if [ -f "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# User configuration

# z / zoxide initialization: prefer zoxide if installed, otherwise keep using
# existing `z`/`fasd` setup. Also provide a small diagnostic helper `z_check`.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
else
  # Ensure the old `z` has a data file location
  export _Z_DATA="${_Z_DATA:-$HOME/.z}"

  # Diagnostic helper: run `z_check` to see what `z` binary (if any) is available
  z_check() {
    if command -v z >/dev/null 2>&1; then
      echo "Found 'z' at: $(command -v z)"
      echo "_Z_DATA = ${_Z_DATA}"
    else
      echo "'z' not found. Consider installing 'zoxide' (recommended) or rupa/z."
      echo "Install zoxide: https://github.com/ajeetdsouza/zoxide"
    fi
  }
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# antigen bundle zsh-users/zsh-autosuggestions

# User specific aliases and functions
# custom bundles

# basic shortened commands
alias node='/usr/bin/node'
alias please='sudo'
alias docker='podman'
alias lazyvim='NVIM_APPNAME=lazyvim nvim'

alias q='exit'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH=$PATH:/home/juuso/.spicetify
export PATH=$PATH:~/.spicetify

# Add dotfiles scripts to PATH for easy access via rofi and terminal
export PATH="$HOME/dotfiles/scripts:$PATH"

# Nvim profiles: default uses personal config, lazyvim available via alias

# Source local machine-specific config if it exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
