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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# set PS1 to include the last
MYPSDIR='$(echo "${PWD/#$HOME/~}")'
# color the last status red if error status.
LAST_STATUS='$(echo $?)'
PS1='$(eval "echo $LAST_STATUS")|$USER@$HOSTNAME:$(eval "echo $MYPSDIR")$ '

export EDITOR=vim
source ~/public_scripts/settings
export PATH=$PATH:~/public_scripts:~/bin
#export PATH=$PATH:/home/sabalaba/data/adt-bundle-linux-x86_64-20130522/sdk/platform-tools
#export PATH=$PATH:/home/sabalaba/data/adt-bundle-linux-x86_64-20130522/sdk/tools
#export PATH=$PATH:/home/sabalaba/data/adt-bundle-linux-x86_64-20130522/sdk/build-tools/android-4.2.2
export PATH=${PATH}:/home/sabalaba/data/android-sdks/tools
export PATH=${PATH}:/home/sabalaba/data/android-sdks/platform-tools
export PATH=$PATH:/home/sabalaba/gcc-arm-none-eabi-4_6-2012q2/bin

case $OSTYPE in 
darwin*) PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin/ ;;
esac

# Aliases
alias work='cd ~/WORK'
alias play='cd ~/PLAY'

# Never use emacs gui...
alias emacs='emacs -nw'
export PATH=~/pebble-dev/arm-cs-tools/bin:$PATH
export PATH=$PATH:/home/sabalaba/Pictures/out_garry_yc_s13_happyhour_Fri-Aug--9-14:55:50-PDT-2013/lmb/scripts/
export LD_LIBRARY_PATH=/home/$USER/eagle-6.2.0/lib

# Set prompt command
export PROMPT_COMMAND='LAST_CMD_STATUS=$?; history -a;'

# Android
export USE_CCACHE=1
export CCACHE_DIR=/data/.android-cache
export PATH=$PATH:/data/linaro/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7-linaro/bin/

export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
