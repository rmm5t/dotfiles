############################################################
## List
############################################################

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
alias la="ls -a"
alias lal="ls -al"

############################################################
## Git
############################################################

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
## Ruby
############################################################

alias a="autotest"
alias smp="staticmatic preview ."

############################################################
## Rails
############################################################

alias ss="script/server"
alias sg="script/generate"
alias sc="script/console"

############################################################
## Miscellaneous
############################################################

alias wgeto="wget -q -O -"
alias sha1="openssl dgst -sha1"
alias sha2="openssl dgst -sha256"

############################################################
