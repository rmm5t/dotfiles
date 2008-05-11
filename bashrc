## This file is sourced by all *interactive* bash shells on startup.  This
## file *should generate no output* or it will break the scp and rcp commands.
############################################################

if [ -e /etc/bashrc ] ; then
  . /etc/bashrc
fi


############################################################
## PATH
############################################################

if [ -d ~/bin ] ; then
  PATH="~/bin:${PATH}"
fi

if [ -d /usr/local/bin ] ; then
  PATH="${PATH}:/usr/local/bin"
fi

# MacPorts
if [ -d /opt/local/bin ] ; then
  PATH="/opt/local/bin:${PATH}"
fi
if [ -d /opt/local/sbin ] ; then
  PATH="/opt/local/sbin:${PATH}"
fi

# MySql
if [ -d /usr/local/mysql/bin ] ; then
  PATH="${PATH}:/usr/local/mysql/bin"
fi

# Subversion
# if [ -d /opt/subversion/bin ] ; then
#   PATH="/opt/subversion/bin:${PATH}"
# fi

PATH=.:${PATH}


############################################################
## Other paths
############################################################

# MacPorts
if [ -d /opt/local/share/man ] ; then
  MANPATH="/opt/local/share/man:${MANPATH}"
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d ~/man ]; then
#   MANPATH="~/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d ~/info ]; then
#   INFOPATH="~/info:${INFOPATH}"
# fi

# DYLD_LIBRARY_PATH
if [[ `uname` == 'Darwin' ]]; then
  if [ -d /opt/local/lib ] ; then
    DYLD_LIBRARY_PATH="/opt/local/lib:${DYLD_LIBRARY_PATH}"
  fi
#   if [ -d /opt/subversion/lib ] ; then
#     DYLD_LIBRARY_PATH="/opt/subversion/lib:${DYLD_LIBRARY_PATH}"
#   fi
fi


############################################################
## Terminal behavior
############################################################

# Change the window title of X terminals
case $TERM in
  xterm*|rxvt|Eterm|eterm)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    ;;
  screen)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
    ;;
esac

# Do not set PS1 for dumb terminals
if [ "$TERM" != 'dumb'  ] && [ -n "$BASH" ]
then
  export PS1='\[\033[32m\]\n[\s: \w]\n\[\033[31m\][\u@\h]\$ \[\033[00m\]'
fi


############################################################
## Optional shell behavior
############################################################

shopt -s cdspell
shopt -s extglob
shopt -s checkwinsize

export PAGER="less"
export HISTIGNORE="&:pwd:ls:ll:lal:[bf]g:exit:rm*:sudo rm*"
export EDITOR="vi"


############################################################
## Aliases
############################################################

alias wgeto="wget -q -O -"
alias sha1="openssl dgst -sha1"
alias sha2="openssl dgst -sha256"

if [[ `uname` == 'Darwin' ]]; then
  alias ls="ls -G"
  # good for dark backgrounds
  export LSCOLORS=gxfxcxdxbxegedabagacad
else
  alias ls="ls --color=auto"
  # good for dark backgrounds
  export LS_COLORS='no=00:fi=00:di=00;36:ln=00;35:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;31:'
  # For LS_COLORS template: $ dircolors /etc/DIR_COLORS
fi

alias ll="ls -l"
alias lal="ls -al"

alias gb="git branch -a -v"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gd="git diff"
alias gl="git pull"
alias glr="git pull --rebase"
alias gp="git push"
alias gs="git status"
alias gco="git checkout"

############################################################
## Bash Completion, if available
############################################################

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
elif  [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif  [ -f /etc/profile.d/bash_completion ]; then
  . /etc/profile.d/bash_completion
fi

# http://onrails.org/articles/2006/11/17/rake-command-completion-using-rake
if [ -f ~/bin/rake_completion ]; then
  complete -C ~/bin/rake_completion -o default rake
fi

############################################################
## Other
############################################################

if [[ "$USER" == '' ]]; then
  # mainly for cygwin terminals. set USER env var if not already set
  USER=$USERNAME
fi
