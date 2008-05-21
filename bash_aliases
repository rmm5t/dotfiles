# Adds an alias to the current shell and to this file.
# Borrowed from Mislav (http://github.com/mislav/dotfiles/tree/master/bash_aliases)
add-alias ()
{
   local name=$1 value=$2
   echo "alias $name='$value'" >> ~/.bash_aliases
   eval "alias $name='$value'"
   alias $name
}

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

alias l="ls"
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

function gu {
  local branch=$1
  if [ -z "$1" ]; then
    branch=master
  fi
  git log --stat origin/$branch..$branch
}

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}
 
function st {
  if [ -d ".svn" ]; then
    svn status
  else
    git status
  fi
}

############################################################
## Subversion
############################################################

# Remove all .svn folders from directory recursively
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' 

############################################################
## Ruby
############################################################

alias a="autotest"
alias smp="staticmatic preview ."

export GEMS=/opt/local/lib/ruby/gems/1.8/gems
function findgem {
  echo `ls $GEMS | grep -i $1 | sort | tail -1`
}

# Use: cdgem <name>, cd's into your gems directory
# that best matches the name provided.
function cdgem {
  cd $GEMS/`findgem $1`
}

# Use: gemdoc <gem name>, opens the rdoc of the gem
# that best matches the name provided.
function gemdoc {
  open $GEMS/../doc/`findgem $1`/rdoc/index.html
}

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
