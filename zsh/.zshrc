# ============================================================================
# OH-MY-ZSH CONFIGURATION
# ============================================================================
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#theme
ZSH_THEME="simple"

# VIM MODE PLUGIN (loaded before oh-my-zsh for proper initialization)
source "$HOME/apps/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

# Vim mode cursor config - customize cursor appearance per mode
# Format: "color style shape" where style can be: steady, blinking
# and shape can be: block, bar, underline
MODE_CURSOR_VIINS="#8bc34a steady bar"        # Insert mode: green bar
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000" # Replace mode: red bar
MODE_CURSOR_VICMD="#ff9800 block"              # Normal mode: orange block
MODE_CURSOR_SEARCH="#ff00ff steady underline"  # Search mode: magenta underline
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar" # Visual mode: orange bar
# ============================================================================
# OH-MY-ZSH BEHAVIOR OPTIONS
# ============================================================================

# Automatically update without prompting
 DISABLE_UPDATE_PROMPT="true"

# Disable auto-setting terminal title (prevents oh-my-zsh from changing window title)
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction (suggests corrections for mistyped commands)
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Alternative: show percentage while waiting for completion
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# --- Git/VCS Options ---
# Disable marking untracked files under VCS as dirty
# This makes repository status checks MUCH faster for large repositories
DISABLE_UNTRACKED_FILES_DIRTY="true"

# ============================================================================
# HISTORY CONFIGURATION
# ============================================================================
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000              # Number of commands to remember in memory
SAVEHIST=10000              # Number of commands to save to file

# History options (see: man zshoptions)
setopt inc_append_history   # Write to history file immediately, not on shell exit
setopt share_history        # Share history between all sessions
setopt hist_ignore_dups     # Don't record duplicate entries consecutively
setopt hist_ignore_space    # Don't record commands that start with a space
setopt hist_reduce_blanks   # Remove superfluous blanks from commands
# setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate
# setopt hist_find_no_dups    # Don't display duplicates when searching history
# setopt hist_save_no_dups    # Don't write duplicate entries in the history file
# setopt extended_history     # Record timestamp of command in HISTFILE
# setopt hist_expire_dups_first # Expire duplicate entries first when trimming history
# setopt hist_verify          # Don't execute immediately upon history expansion

# Increase history size for more comprehensive tracking
# HISTSIZE=50000
# SAVEHIST=50000

# ============================================================================
# PLUGINS CONFIGURATION
# ============================================================================
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Plugin descriptions:
# - git: Git aliases and functions (gst, gco, gp, etc.)
# - yarn: Yarn package manager completions and aliases
# - node: Node.js completions
# - jsontools: JSON tools (pp_json, is_json, urlencode_json, urldecode_json)
# - docker: Docker completions and aliases
# - vi-mode: Vi keybindings in zsh (ESC for normal mode)
# - zsh-autosuggestions: Fish-like autosuggestions (suggests commands as you type)
# - common-aliases: Bunch of useful aliases (l, la, ll, etc.)
# - fasd: Quick access to files and directories (z, d, f, etc.)
# - zsh-syntax-highlighting: Fish-like syntax highlighting

plugins=(
    git
    yarn
    node
    jsontools
    docker
    vi-mode
    zsh-autosuggestions
    common-aliases
    fasd
    zsh-syntax-highlighting
)

# ============================================================================
# LOAD OH-MY-ZSH
# ============================================================================
source $ZSH/oh-my-zsh.sh

# ============================================================================
# VI MODE CONFIGURATION
# ============================================================================
# Enable vi keybindings after oh-my-zsh has loaded
bindkey -v
export KEYTIMEOUT=5  # Reduce ESC delay (default is 0.4 seconds)

# zsh-syntax-highlighting: source if installed in custom plugins
if [[ -f "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ============================================================================
# DIRECTORY JUMPING (z/zoxide)
# ============================================================================
# z / zoxide initialization: prefer zoxide if installed, otherwise keep using
# existing `z`/`fasd` setup. Also provide a small diagnostic helper `z_check`.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Directory stack options
# setopt pushd_ignore_dups   # Don't push multiple copies of same directory
# setopt pushd_minus         # Exchange meanings of +/- when navigating directory stack

# Globbing and expansion
# setopt extended_glob       # Use extended globbing syntax (#, ~, ^)
# setopt glob_dots           # Include dotfiles in globbing
# setopt null_glob           # Remove non-matching globs from argument list
# setopt numeric_glob_sort   # Sort numeric filenames numerically

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

# Manual pages path
# export MANPATH="/usr/local/man:$MANPATH"

# Language environment (uncomment if you need specific locale)
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# Preferred editor (used by many CLI tools)
export EDITOR='nvim'
export VISUAL='nvim'  # Visual editor (often same as EDITOR)
# ============================================================================
# ALIASES
# ============================================================================
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# --- Config Shortcuts ---
# alias zshconfig="nvim ~/.zshrc"
# alias zshreload="source ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"

# --- Basic Shortened Commands ---
alias please='sudo'
alias lazyvim='NVIM_APPNAME=lazyvim nvim'
alias clean="sudo dnf autoremove && sudo dnf clean all" # clean up (Fedora)
alias upgrade=" sudo dnf upgrade --refresh && clean" # Refresh repos + update

alias q='exit'

# --- System Shortcuts ---
 alias c='clear'
 alias h='history'
 alias md='mkdir -p'
 alias rd='rmdir'

# --- List Commands (some from common-aliases plugin) ---
 alias l='ls -lah'      # List all with human-readable sizes
 alias ll='ls -lh'      # Long format
 alias la='ls -lAh'     # List all except . and ..
 alias lt='ls -ltrh'    # Sort by time, newest last
 alias lsize='ls -lSrh' # Sort by size, largest last

# --- Directory Navigation --- 
 alias ..='cd ..'
 alias ...='cd ../..'
 alias ....='cd ../../..'

# --- Disk Usage ---
alias df='df -h'    # Human-readable disk usage
alias du='du -h'    # Human-readable directory size
alias duh='du -h --max-depth=1 | sort -h'  # Show directory sizes sorted

# ============================================================================
# GIT ALIASES & FUNCTIONS
# ============================================================================
# Short git command for quick operations
alias g='git'

# Git quick aliases
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'
alias gapf='git commit --amend --no-edit && git push -f' 

# ============================================================================
# USEFUL FUNCTIONS
# ============================================================================


# Extract any archive format
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick file search (uses fd if available, otherwise find)
# search() {
#     if command -v fd >/dev/null 2>&1; then
#         fd "$@"
#     else
#         find . -iname "*$1*"
#     fi
# }

# Quick content search (uses rg if available, otherwise grep)
# searchin() {
#     if command -v rg >/dev/null 2>&1; then
#         rg "$@"
#     else
#         grep -r "$@" .
#     fi
# }

# ============================================================================
# TOOL INTEGRATIONS
# ============================================================================

# --- Node Version Manager (NVM) ---
export NVM_DIR="$HOME/.nvm"
# [[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Lazy load NVM for faster shell startup:
nvm() {
    unset -f nvm node npm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}
node() {
    unset -f nvm node npm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}
npm() {
    unset -f nvm node npm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

# --- FZF (Fuzzy Finder) Integration ---
# Uncomment if you have fzf installed
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ============================================================================
# ADDITIONAL PATH EXPORTS
# ============================================================================

# Spicetify (Spotify customization)
if [[ -d "$HOME/.spicetify" ]]; then
    export PATH="$PATH:$HOME/.spicetify"
fi

# Dotfiles scripts - add to PATH for easy access via rofi and terminal
export PATH="$HOME/dotfiles/scripts:$PATH"


# ============================================================================
# LOCAL MACHINE CONFIGURATION
# ============================================================================
# Source local machine-specific config if it exists
# Use this file for machine-specific settings that shouldn't be in dotfiles
[[ -f ~/.zshrc.local ]] && source "$HOME/.zshrc.local"

# ============================================================================
# PERFORMANCE PROFILING
# ============================================================================
# To profile zsh startup time, uncomment the line at the very top of this file
# and add this at the bottom:
# zprof
