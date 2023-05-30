# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Use vim commands
set -o vi

# Set pager
export PAGER=less

# Git stuff
MY_GIT_PS1=""
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    MY_GIT_PS1="\$(__git_ps1)"
    export GIT_PS1_SHOWDIRTYSTATE=1
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\> '
    PS1="\n\[\033[38;5;6m\]\u@\h:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\$\[$(tput sgr0)\] "
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    PS1='\n\[\033]0;\h: ${PWD}\007\033[0;36m\]\h: \[\033[0;33m${PWD}\033[0m\]\n> '
    # http://bashrcgenerator.com/
    PS1="\n\[\033[38;5;6m\]\u@\h:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]${MY_GIT_PS1}\n\$\[$(tput sgr0)\] "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

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

function history_of_file() {
    url=$1 # current url of file
    svn log -q $url | grep -E -e "^r[[:digit:]]+" -o | cut -c2- | sort -n | {

#       first revision as full text
        echo
        read r
        svn log -r$r $url@HEAD
        svn cat -r$r $url@HEAD
        echo

#       remaining revisions as differences to previous revision
        while read r
        do
            echo
            svn log -r$r $url@HEAD
            svn diff -c$r $url@HEAD
            echo
        done
    }
}


# history_of_file
#
# Outputs the full history of a given file as a sequence of
# logentry/diff pairs.  The first revision of the file is emitted as
# full text since there's not previous version to compare it to.

#function history_of_file() {
function svn_file_history() {
    url=$1 # current url of file
    svn log -q $url | grep -E -e "^r[[:digit:]]+" -o | cut -c2- | sort -n | {

#       first revision as full text
        echo
        read r
        svn log -r$r $url@HEAD
        svn cat -r$r $url@HEAD
        echo

#       remaining revisions as differences to previous revision
        while read r
        do
            echo
            svn log -r$r $url@HEAD
            svn diff -c$r $url@HEAD
            echo
        done
    }
}

# other environment variables
export PKG_FFLAGS='-Wall -pedantic'
export PKG_CFLAGS='-Wall -pedantic'
#export JAVA_HOME='/usr/lib/jvm/java-6-sun/jre'

# pretty terminal colors!
export LS_COLORS="${LS_COLORS}*.csv=00;38;5;28:"
export LS_COLORS="${LS_COLORS}*.R=01;38;5;39:"
export LS_COLORS="${LS_COLORS}*.sql=00;38;5;127:"
export LS_COLORS="${LS_COLORS}*.py=00;38;5;226:"
export LS_COLORS="${LS_COLORS}*.pdf=00;38;5;250;48;5;52:"
export LS_COLORS="${LS_COLORS}*.txt=00;38;5;250;48;5;22:"
export LS_COLORS="${LS_COLORS}*.log=00;38;5;250;48;5;22:"

# workaround for gvim bug
#gvim(){ (setsid /usr/bin/gvim -f "$@" & true) 2> /dev/null; }
# for vim-r-plugin
if [ "x$DISPLAY" == "x" ]
then
    function tvim(){ tmux new-session "vim $@" ; }
else
    alias vim='vim --servername VIM'
    function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
fi
# set PATH so it includes my private bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

