## This file is sourced by all *interactive* bash shells on startup.  This
## file *should generate no output* or it will break the scp and rcp commands.
############################################################

if [ -e /etc/bashrc ] ; then
  . /etc/bashrc
fi

# Suppress MacOS warnign about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

############################################################
## MANPATH
############################################################

function conditionally_prefix_manpath {
  local dir=$1
  if [ -d $dir ]; then
    MANPATH="$dir:${MANPATH}"
  fi
}

conditionally_prefix_manpath /usr/local/man
conditionally_prefix_manpath ~/man

############################################################
## SYSTEM PATH
############################################################

function conditionally_prefix_path {
  local dir=$1
  if [ -d $dir ]; then
    PATH="$dir:${PATH}"
  fi
}

conditionally_prefix_path /usr/local/bin
conditionally_prefix_path /usr/local/sbin
conditionally_prefix_path /usr/texbin

############################################################
## HOMEBREW
############################################################

if [ -f /opt/homebrew/bin/brew ] && [ `uname -m` == "arm64" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
  conditionally_prefix_path /opt/homebrew/opt/python/libexec/bin
elif [ -f /usr/local/bin/brew ]; then
  eval $(/usr/local/bin/brew shellenv)
  conditionally_prefix_path /usr/local/opt/python/libexec/bin
fi

export PATH="$PATH:$(go env GOPATH)/bin"
source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"

############################################################
## LOCAL PATH
############################################################

conditionally_prefix_path ~/bin
conditionally_prefix_path ~/bin/private
conditionally_prefix_path ~/.nodenv/bin

if [ `which rbenv 2> /dev/null` ]; then
  eval "$(rbenv init -)"
fi

if [ `which nodenv 2> /dev/null` ]; then
  eval "$(nodenv init -)"
fi

PATH=.:./bin:./node_modules/.bin:${PATH}

############################################################
## Other paths
############################################################

function conditionally_prefix_cdpath {
  local dir=$1
  if [ -d $dir ]; then
    CDPATH="$dir:${CDPATH}"
  fi
}

conditionally_prefix_cdpath ~/work
conditionally_prefix_cdpath ~/work/oss

CDPATH=.:${CDPATH}

# Set INFOPATH so it includes users' private info if it exists
# if [ -d ~/info ]; then
#   INFOPATH="~/info:${INFOPATH}"
# fi

############################################################
## General development configurations
###########################################################

export RBXOPT=-X19

############################################################
## Terminal behavior
############################################################

if [ -f ~/.bash_powerline ]; then
  . ~/.bash_powerline
fi

# if [ -n "$BASH" ]; then
#   export PS1='\[\033[32m\]\n[\s: \w] (⬥ $(ruby_prompt)) (⬢ $(node_prompt)) $(git_prompt)\n\[\033[31m\][\u@\h]\$ \[\033[00m\]'
# fi


############################################################
## Optional shell behavior
############################################################

shopt -s cdspell
shopt -s extglob
shopt -s checkwinsize

export PAGER="less"
export EDITOR="emacsclient -nw"

############################################################
## History
############################################################

# When you exit a shell, the history from that session is appended to
# ~/.bash_history.  Without this, you might very well lose the history of entire
# sessions (weird that this is not enabled by default).
shopt -s histappend

export HISTIGNORE="&:pwd:ls:ll:lal:[bf]g:exit:rm*:sudo rm*"
# remove duplicates from the history (when a new item is added)
export HISTCONTROL=erasedups
# increase the default size from only 1,000 items
export HISTSIZE=10000
export HISTFILESIZE=1000000

############################################################
## Aliases
############################################################

if [ -e ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

############################################################
## Bash Completion, if available
############################################################

if [ -f /opt/homebrew/etc/bash_completion ] && [ `uname -m` == "arm64" ]; then
  . /opt/homebrew/etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
elif  [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif  [ -f /etc/profile.d/bash_completion ]; then
  . /etc/profile.d/bash_completion
elif [ -f ~/.bash_completion ]; then
  # Fallback. This should be sourced by the above scripts.
  . ~/.bash_completion
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/rmcgeary/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . /Users/rmcgeary/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/rmcgeary/.config/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . /Users/rmcgeary/.config/yarn/global/node_modules/tabtab/.completions/sls.bash

############################################################
## Other
############################################################

if [[ "$USER" == '' ]]; then
  # mainly for cygwin terminals. set USER env var if not already set
  USER=$USERNAME
fi

# Make sure this appears even after rbenv, git-prompt and other shell extensions
# that manipulate the prompt.
if [ `which direnv 2> /dev/null` ]; then
  eval "$(direnv hook bash)"
fi

############################################################
## Ruby Performance Boost (see https://gist.github.com/1688857)
############################################################

# export RUBY_GC_MALLOC_LIMIT=60000000
# # export RUBY_FREE_MIN=200000 # Ruby <= 2.0
# export RUBY_GC_HEAP_FREE_SLOTS=200000 # Ruby >= 2.1
