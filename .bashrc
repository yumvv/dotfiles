#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=30000
HISTFILESIZE=20000

#
# LANG
#
export LANG=en_US.UTF-8
#
# vi keybind
#
set -o emacs
#
# Default Editor
#
export EDITOR=vim

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

export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Cyan [\w]$Color_Off\n$ "

case "${OSTYPE}" in
linux*|freebsd*|cygwin*)
    export PS1="$Color_Off\n$USERCOLOR\u$HOSTCOLOR@\h$Cyan [\w]$Color_Off\n$ "
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
