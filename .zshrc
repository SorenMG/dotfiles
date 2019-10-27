### zsh ###
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
unsetopt SHARE_HISTORY           # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Dont write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
unsetopt HIST_VERIFY             # Dont execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt NO_HUP                    # Job control for zsh
setopt AUTO_CD                   # Disable ambigous CD 
setopt CDABLE_VARS               # Enable filename expansion
setopt ALWAYS_TO_END             # Move cursor to end
setopt AUTO_LIST                 # List choices
setopt AUTO_MENU                 # Automatically use completion after second request
unsetopt HUP
unsetopt CHECK_JOBS
###

### Oh-my-zsh
# Path to your oh-my-zsh installation.
export ZSH="/Users/soren/.oh-my-zsh"

# Theme
ZSH_THEME="oxide"

# Plugins
plugins=(git
        github
        gitignore
        zsh-autosuggestions
        kubectl
        ng
        npm
        docker
        brew)

source $ZSH/oh-my-zsh.sh
###

### ZSH-autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d16036"
bindkey '\e' autosuggest-execute
###

### Editor
export EDITOR=nvim
###

### Aliases
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias wolf='python3 ~/repos/py-calc/main.py'

### Mac alias
alias brewup='brew update && brew upgrade && brew cu && brew cleanup; brew doctor'
###
