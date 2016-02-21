# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set default user for powerline
DEFAULT_USER="akshayp"
# Set name of the theme to load.
ZSH_THEME="agnoster"

#Functions

function tree() {
    if [ "$1" != "" ]  #if parameter exists, use as base folder
       then cd "$1"
       fi
    pwd
    ls -R | grep ":$" |   \
       sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
    # 1st sed: remove colons
    # 2nd sed: replace higher level folder names with dashes
    # 3rd sed: indent graph three spaces
    # 4th sed: replace first dash with a vertical bar
    if [ `ls -F -1 | grep "/" | wc -l` = 0 ]   # check if no folders
       then echo "   -> no sub-directories"
    fi
}

function gitfork() {
  username=($whoami)
  fork=$(sed 's//hello/')
  git clone "$1"
  repo=$(basename $1 .git)
  echo "Changing directory to: " $repo
  cd $repo
  echo "Adding upstream"
  git remote add upstream $1
}

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
alias c="http"
alias gitsync="git fetch upstream; git merge upstream/master; git push"

# System Stats
alias up="uptime"
alias sup="ps auxwww"
alias df="df -h"

#Plugins
plugins=(git brew colored-man extract git-extras node npm svn colorize)
source $ZSH/oh-my-zsh.sh

#Override
alias lst='tree'

# Exports
export PATH=/usr/local/share/npm/bin:/home/y/bin:/usr/local/bin:/usr/X11/bin:/usr/local/bin/localizr_cli/bin:/usr/local/opt/go/libexec/bin:$PATH
export NODE_PATH="/usr/local/lib/node_modules:/usr/local/share/npm"
export GOPATH=$HOME/Dev
export TERM="xterm-color"
export CLICOLOR="true"
# export LSCOLORS="exfxcxdxbxegedabagacad" #I like these LS colors better
export EDITOR='subl -w'

# History Management
HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

#Autocompletion
eval "$(grunt --completion=zsh)"

#Local zsh overrides
if [ -e ~/.zsh_local ]; then
    source ~/.zsh_local
fi

#Fix ulimit on OSX
ulimit -n 10000

fpath=(/usr/local/share/zsh-completions $fpath)
