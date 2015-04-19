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

# set PS1 to include the last
MYPSDIR='$(echo "`basename ${PWD/#$HOME/~}`")'
# color the last status red if error status.
LAST_STATUS='$(echo $?)'
PS1='$(eval "echo $LAST_STATUS")|$USER@$HOSTNAME:$(eval "echo $MYPSDIR")$ '

export EDITOR=vim
source ~/public_scripts/settings
export PATH=$PATH:~/public_scripts:~/bin
export PATH=${PATH}:/home/sabalaba/sources/adt-bundle-linux-x86_64/sdk/tools
export PATH=${PATH}:/home/sabalaba/sources/adt-bundle-linux-x86_64/sdk/platform-tools


# Aliases
alias work='cd ~/WORK'
alias play='cd ~/PLAY'

# Never use emacs gui...
alias emacs='emacs -nw'
export PATH=~/pebble-dev/arm-cs-tools/bin:$PATH
export LD_LIBRARY_PATH=/home/$USER/eagle-6.2.0/lib

# Set prompt command
# export PROMPT_COMMAND='LAST_CMD_STATUS=$?; history -a;'
export PROMPT_COMMAND='history -a;history -c;history -r'

# Android
export USE_CCACHE=1
export CCACHE_DIR=/data/.android-cache
export PATH=$PATH:/data/linaro/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7-linaro/bin/

export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export GOPATH=~/data/programming/go/path
export PATH=$PATH:$GOPATH/bin

# Boost
export BOOST_INCLUDE_PATH=/usr/include/boost
export BOOST_LIB_PATH=/usr/lib
export BOOST_LIB_SUFFIX=
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib

# Add cuda binaries to the path.
export PATH=$PATH:/usr/local/cuda/bin

##
## Main
##

alias g='cd ~/games'
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/intel/opencl-1.2-3.2.1.16712/lib64:/usr/lib/atlas-base
# OS Specific
case $OSTYPE in
	darwin*)
		PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin/
		;;
esac

export SURFRAW_text_browser=w3m
export SURFRAW_graphical_browser=chromium-browser
alias chrome='chromium-browser &> /dev/null &'

# Haskell
export PATH=$HOME/.cabal/bin:${PATH}
alias ghci='ghci -XParallelListComp'
export PATH=$PATH:/usr/local/cuda-6.5/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64:/usr/local/cuda-6.5/lib

# init fastd
eval "$(fasd --init auto)"
alias c='fasd_cd -d -i'
alias f='fasd'
alias v='fasd -e vim'
alias p='fasd -e mupdf'

# source ~/.paths

alias python=python3
alias ipython=ipython3
