# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# set PS1 to include the last
MYPSDIR='$(echo "`basename ${PWD/#$HOME/~}`")'
# color the last status red if error status.
LAST_STATUS='$(echo $?)'
PS1='$(eval "echo $LAST_STATUS")|$USER@$HOSTNAME:$(eval "echo $MYPSDIR")$ '
# Set prompt command
export PROMPT_COMMAND='history -a;history -c;history -r'

export EDITOR=vim
source ~/public_scripts/settings

# Path
export PATH="${PATH}:~/public_scripts"

# Never use emacs gui...
alias emacs='emacs -nw'

# Use VIM as my manpager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# init fastd
eval "$(fasd --init auto)"
alias c='fasd_cd -d -i'
alias f='fasd'
alias v='fasd -e vim'
alias p='fasd -e mupdf'
