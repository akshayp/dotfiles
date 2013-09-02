# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="wedisagree"

# Aliases

# Old DOS habits
alias cls="clear"
alias clc="clear"

# Interactive/Safe Shell
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias mkdir='mkdir -p'
alias grep='grep -rn --color=auto --exclude-dir=".svn"'

# Shortcuts
alias h="history"
alias home="cd ~"
alias desktop="cd ~/Desktop"
alias download="cd ~/Downloads"
alias edit="subl"
alias e="subl"
alias svndiff="svn diff --diff-cmd colordiff"

# System Stats
alias up="uptime"
alias sup="ps auxwww"
alias df="df -h"

#Plugins
plugins=(git brew colored-man extract git-extras node npm svn)
source $ZSH/oh-my-zsh.sh
source ~/.zsh_local

# Exports
export PATH=/usr/local/share/npm/bin:/home/y/bin:/usr/local/bin:/usr/X11/bin:/usr/local/bin/localizr_cli/bin:$PATH
export NODE_PATH="/usr/local/lib/node_modules:/usr/local/share/npm"
export TERM="xterm-color"
export CLICOLOR="true"
export LSCOLORS="exfxcxdxbxegedabagacad" #I like these LS colors better

# History Management
HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS