#
# ~/.bashrc
#

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export BROWSER=/usr/bin/palemoon

# Alias system

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias post='~/post'
alias clean='~/clean'

# ex - archive extractor
# usage: ex <file>
  ex ()
    {
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   tar xjf $1   ;;
          *.tar.gz)    tar xzf $1   ;;
          *.bz2)       bunzip2 $1   ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1    ;;
          *.tar)       tar xf $1    ;;
          *.tbz2)      tar xjf $1   ;;
          *.tgz)       tar xzf $1   ;;
          *.zip)       unzip $1     ;;
          *.Z)         uncompress $1;;
          *.7z)        7z x $1      ;;
          *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
      else
        echo "'$1' is not a valid file"
      fi
    }

force_color_prompt=yes

# Greetings
echo
echo Welcome to Kibojoe Linux!
echo

# Settings prompt
CURRENTUSER=`whoami`
if [ "$CURRENTUSER" = "root" ]; then
  PS1="┌─ \d » \@ » \[$(tput bold)\]\[\033[38;5;196m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] on \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;6m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;202m\]\w\[$(tput sgr0)\]\n└─| " #root
else
  PS1="┌─ \d » \@ » \[$(tput bold)\]\[\033[38;5;34m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] on \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;6m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] in \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;202m\]\w\[$(tput sgr0)\]\n└─| " #user
fi
