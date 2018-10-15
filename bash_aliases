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
## Bash
############################################################

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias ~="cd ~"

alias c="clear"

alias path='echo -e ${PATH//:/\\n}'
alias ax="chmod a+x"

############################################################
## List
############################################################

# for Mac (good for dark backgrounds)
export LSCOLORS=gxfxcxdxbxegedabagacad
# for non-Mac and `tree` command (good for dark backgrounds)
# For LS_COLORS template: $ dircolors /etc/DIR_COLORS
export LS_COLORS='no=00:fi=00:di=00;36:ln=00;35:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;31:'

if [[ `uname` == 'Darwin' ]]; then
  alias ls="ls -G"
else
  alias ls="ls --color=auto"
fi

alias l="ls"
alias ll="ls -lh"
alias la="ls -a"
alias lal="ls -alh"

############################################################
## Git
############################################################

alias g="git"
alias gb="tput rmam; git branch -a -v; tput smam"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gd="git diff"
alias gl="git pull"
alias glr="git pull --rebase"
alias gf="git fetch"
alias gp="git push"
alias gs="git status -sb"
alias gr="git remote"
alias grp="git remote prune"
alias gcp="git cherry-pick"
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn --no-merges"
alias gw="git whatchanged"
alias gsu="git submodule update --init --recursive"
alias gi="git config branch.master.remote 'origin'; git config branch.master.merge 'refs/heads/master'"
if [ `which hub 2> /dev/null` ]; then
  alias git="hub"
fi
alias gchurn="git log --pretty="format:" --name-only | grep -vE '^(vendor/|$)' | sort | uniq -c | sort"
alias gcherry="git log --left-right --graph --cherry-pick --oneline" # master...feature

alias gclean="git fetch -p && for branch in \`git branch -vv | grep ': gone]' | awk '{print \$1}'\`; do git branch -d \$branch; done"
alias ggemfilelock="git checkout HEAD -- Gemfile.lock && bundle install"

function gsd {
  target=${1%/}
  git submodule deinit $target
  git rm -f $target
  rm -rf .git/modules/$target
}

# Useful report of what has been committed locally but not yet pushed to another
# branch.  Defaults to the remote origin/master.  The u is supposed to stand for
# undone, unpushed, or something.
function gu {
  local branch=$1
  if [ -z "$1" ]; then
    branch=master
  fi
  if [[ ! "$branch" =~ "/" ]]; then
    branch=origin/$branch
  fi
  local cmd="git cherry -v $branch"
  echo $cmd
  $cmd
}

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $*
  fi
}

function gprune {
  local remote=$1
  if [ -z "$1" ]; then
    remote=origin
  fi
  local cmd="git remote prune $remote"
  echo $cmd
  $cmd
}

function st {
  if [ -d ".svn" ]; then
    svn status
  else
    git status -sb
  fi
}

############################################################
## Subversion
############################################################

# Remove all .svn folders from directory recursively
alias svn-clean='find . -name .svn -print0 | xargs -0 rm -rf'

############################################################
## OS X
############################################################

# Get rid of those pesky .DS_Store files recursively
alias dstore-clean='find . -type f -name .DS_Store -print0 | xargs -0 rm'

# Track who is listening to your iTunes music
alias whotunes='lsof -r 2 -n -P -F n -c iTunes -a -i TCP@`hostname`:3689'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

############################################################
## Ruby
############################################################

alias rtags="ctags -e -R app lib vendor tasks"

function gemdir {
  echo `gem env gemdir`
}

function gemfind {
  local gems=`gemdir`/gems
  echo `ls $gems | grep -i $1 | sort | tail -1`
}

# Use: gemcd <name>, cd's into your gems directory
# that best matches the name provided.
function gemcd {
  cd `gemdir`/gems/`gemfind $1`
}

# Use: gemdoc <gem name>, opens the rdoc of the gem
# that best matches the name provided.
function gemdoc {
  open `gemdir`/doc/`gemfind $1`/rdoc/index.html
}

alias rhash="rbenv rehash"

function update-rubygems {
  cyan=`tput setaf 6`
  reset=`tput sgr0`
  for version in `rbenv whence gem`; do
    rbenv shell "$version"
    echo
    echo "${cyan}Updating rubygems for ${version}${reset}"
    gem update --system --quiet
    echo
    echo "${cyan}Updating bundler for ${version}${reset}"
    gem update bundler --quiet
  done
}

############################################################
## Bundler
############################################################
function ignore_vendor_ruby {
  grep -q 'vendor/ruby' .gitignore > /dev/null
  if [[ $? -ne 0 ]]; then
    echo -e "\nvendor/ruby" >> .gitignore
  fi
}

alias b="bundle"
alias bu="b update"
alias be="b exec"
alias binit="bi && bundle package"
alias ba="bundle-audit update && bundle-audit"

# This relies on a global config to force a `--path vendor` whenever `bundle
# install` is executed.
# ----------
# Bundler v1: Be sure to install https://github.com/rmm5t/rbenv-bundle-path-fix
# Bundler v2: Be sure to first run: `bundle config --global path vendor`
function bi {
  if [ -f ./vendor/cache ]; then
    b install --local $*
  else
    b install $*
  fi
}

############################################################
## Middleman
############################################################
alias m="be middleman"

############################################################
## NPM/Yarn
############################################################

alias y="yarn"
alias yi="yarn install"
alias yu="yarn upgrade"
alias yinit="echo -e \"yarn-offline-mirror \\\"./node_cache\\\"\\nyarn-offline-mirror-pruning true\" >> ./.yarnrc; yi"

############################################################
## Docker
############################################################

alias d="docker"
alias dc="docker-compose"
alias dcr="dc run"
alias docker_rm_all='docker rm $(docker ps -a -q)'
alias dr="docker run -it --rm"

############################################################
## AWS Stuff
############################################################

alias dynamodb-start="docker run -d -p 8000:8000 -v ~/.dynamodb/data:/data --name dynamodb --restart always dwmkerr/dynamodb -dbPath /data -sharedDb"
alias dynamodb-stop="docker stop dynamodb"

alias postgis-start="docker run -d -p 5433:5432 -v ~/.postgis/data:/var/lib/postgresql/data --name postgis -e POSTGRES_PASSWORD=postgres --restart always mdillon/postgis"
alias postgis-stop="docker stop postgis"

############################################################
## Heroku
############################################################

function heroku_command {
  if [ -z "$*" ]; then
    echo "run console"
  else
    echo "$*"
  fi
}

function hstaging {
  heroku `heroku_command $*` --remote staging
}

function hproduction {
  heroku `heroku_command $*` --remote production
}

alias deploy_hproduction='hproduction maintenance:on && git push production && hproduction run rake db:migrate && hproduction maintenance:off'
alias deploy_hstaging='hstaging maintenance:on && git push staging && hstaging run rake db:migrate && hstaging maintenance:off'

############################################################
## Rails
############################################################

alias tl="tail -f log/development.log"
alias ss="spring stop"

# Rails 3 or 4
function r {
  if [ -e "script/rails" ]; then
    script/rails $*
  else
    rails $* # Assumes ./bin is in the PATH
  fi
}

# Pow / Powder
alias p="powder"

############################################################
## MongoDB
############################################################
alias repair-mongo="rm /usr/local/var/mongodb/mongod.lock && mongod --repair"

############################################################
## Media
############################################################

# brew install ffmpeg --with-libvorbis --with-theora --with-fdk-aac --with-tools
function mp32ogg {
  file=$1
  ffmpeg -i "$file" -c:a libvorbis -q:a 4 $(basename ${file} .mp3).ogg
}

function ogg2mp3 {
  file=$1
  ffmpeg -i "$file" -c:a libmp3lame $(basename ${file} .ogg).mp3
}

############################################################
## Emacs
############################################################

alias e="emacsclient -nw"

############################################################
## Miscellaneous
############################################################

alias install_ffmpeg='brew install ffmpeg --with-libvorbis --with-theora --with-fdk-aac --with-faac --with-tools'

export GREP_COLOR="1;37;41"
alias grep="grep --color=auto"
alias wgeto="wget -q -O -"
if ! [ `which md5 2> /dev/null` ]; then
  alias md5="openssl dgst -md5"
fi
alias sha1="openssl dgst -sha1"
alias sha2="openssl dgst -sha256" # shortcut
alias sha256="openssl dgst -sha256"
alias sha512="openssl dgst -sha512"
alias b64="openssl enc -base64"
alias 256color="export TERM=xterm-256color"
alias prettyjson="python -mjson.tool"
alias dig="dig +noall +answer"

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

alias whichlinux='uname -a; cat /etc/*release; cat /etc/issue'

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip4="curl -s4 http://icanhazip.com/"
alias mylocation="curl -s4 http://ip-api.com/json | prettyjson"

function serve {
  local port=$1
  : ${port:=3000}
  ruby -rwebrick -e"s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd, :MimeTypes => WEBrick::HTTPUtils::load_mime_types('/etc/apache2/mime.types')); trap(%q(INT)) { s.shutdown }; s.start"
}

function eachd {
  for dir in *; do
    cd $dir
    echo $dir
    $1
    cd ..
  done
}

function fakefile {
  let mb=$1
  let bytes=mb*1048576
  dd if=/dev/random of=${mb}MB-fakefile bs=${bytes} count=1 &> /dev/null
}

function color() {
  for c; do
    tput setab $c
    printf ' %03d ' $c
  done
  tput sgr0
  echo
}

function colors() {
  x=6
  y=40
  color {0..7}
  color {8..15}
  for ((i=0; i<$y; i++)); do
    color $(seq $((i*$x+16)) $((i*$x+$x-1+16)))
  done
}

############################################################
