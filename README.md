# Getting Started

Clone this (or a forked version of this) repository, and update all the git
submodules within.

    $ cd ~
    $ git clone https://rmm5t@github.com/rmm5t/dotfiles.git .dotfiles
    $ cd .dotfiles
    $ git submodule update --init --recursive

(Option 1) If you'd like to symlink everythin withing this repository to your
home directory, run `install.rb`. This will also update the git submodules.

    $ cd ~/.dotfiles
    $ ./install.rb

(Option 2) If you'd like to just symlink one or more configurations to your home
directory manually, you can.

    $ cd ~/.dotfiles
    $ ln -ns emacs   ~/.emacs
    $ ln -ns emacs.d ~/.emacs.d


