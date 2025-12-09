# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER="akshayp"
# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git colored-man-pages docker extract git-extras node npm colorize)
source $ZSH/oh-my-zsh.sh

#Override
alias lst='tree'

# Exports
export TERM="xterm-color"
export CLICOLOR="true"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export EDITOR='subl -n -w'

# History Management
HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

#Local zsh overrides
if [ -e ~/.zsh_local ]; then
    source ~/.zsh_local
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh
