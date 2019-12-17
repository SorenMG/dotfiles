export NNN_USE_EDITOR=1
export NNN_PLUG='o:fzopen'
export PATH=~/.cargo/bin:$PATH

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

### Editor
export EDITOR=nvim
###

### Bundles
source /usr/local/share/antigen/antigen.zsh

antigen bundle git
antigen bundle fzf
antigen bundle tmux
antigen bundle jarun/nnn

antigen theme romkatv/powerlevel10k

antigen apply
###

### Aliases
alias ls='colorls -a'
alias n='nnn -d -H'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias wolf='python3 ~/repos/py-calc/main.py'

### Mac alias
alias brewup='brew update && brew upgrade && brew cleanup; brew doctor'
###
# Fix popback to vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

nnn -d -H
