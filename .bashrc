#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=30000
HISTFILESIZE=20000

# Debian/Ubuntu Bash completion
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#
# LANG
#
export LANG=ja_JP.UTF-8
#
# vi keybind
#
set -o emacs
#
# Default Editor
#
export EDITOR=vim
#
# Page viewer
#
export LESS='-i -M -R'

#
# Prompt Colors
#

# Color Define

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

case "${OSTYPE}" in
freebsd*)
    HOSTCOLOR=$'%{\e[38;5;'"$(printf "%d\n" 0x$(hostname|md5|cut -c1-2))"'m%}'
    USERCOLOR=$'%{\e[38;5;'"$(printf "%d\n" 0x$(echo $USERNAME|md5|cut -c1-2))"'m%}'
    ;;
linux*|cygwin*|msys*)
    HOSTCOLOR=$'\e[38;5;'"$(printf "%d\n" 0x$(hostname|md5sum|cut -c1-2))"'m'
    USERCOLOR=$'\e[38;5;'"$(printf "%d\n" 0x$(echo $USERNAME|md5sum|cut -c1-2))"'m'
    ;;
esac

case "${OSTYPE}" in
linux*|freebsd*|cygwin*)
    if [ -f /etc/bash_completion.d/git-prompt ]; then
        export GIT_PS1_SHOWDIRTYSTATE=true
        export GIT_PS1_SHOWSTASHSTATE=true
        export GIT_PS1_SHOWUNTRACKEDFILES=true
        export GIT_PS1_SHOWUPSTREAM="auto"
        export GIT_PS1_SHOWCOLORHINTS=true
        export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Cyan [\w]$Yellow\$(__git_ps1 ' (%s)')$Color_Off\n$ "
    elif [ -f /usr/share/git/completion/git-completion.bash ]; then
        source /usr/share/git/completion/git-prompt.sh
        source /usr/share/git/completion/git-completion.bash
        export GIT_PS1_SHOWDIRTYSTATE=true
        export GIT_PS1_SHOWSTASHSTATE=true
        export GIT_PS1_SHOWUNTRACKEDFILES=true
        export GIT_PS1_SHOWUPSTREAM="auto"
        export GIT_PS1_SHOWCOLORHINTS=true
        export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Cyan [\w]$Yellow\$(__git_ps1 ' (%s)')$Color_Off\n$ "
    else
        export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Cyan [\w]$Color_Off\n$ "
    fi
    ;;
msys*)
    export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Green $MSYSTEM $Cyan [\w]$Color_Off\n$ "
    ;;
esac

## alias設定

[ -f ~/dotfiles/.bashrc.alias ] && source ~/dotfiles/.bashrc.alias

case "${OSTYPE}" in
# Mac(Unix)
msys*)
    # ここに設定
    [ -f ~/dotfiles/.bashrc.msys ] && source ~/dotfiles/.bashrc.msys
    ;;
# Linux
linux*)
    # ここに設定
    [ -f ~/dotfiles/.bashrc.linux ] && source ~/dotfiles/.bashrc.linux
    ;;
# Windows(Cygwin)
cygwin*)
    # ここに設定
    [ -f ~/dotfiles/.bashrc.cygwin ] && source ~/dotfiles/.bashrc.cygwin
    ;;
esac


## local固有設定
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
