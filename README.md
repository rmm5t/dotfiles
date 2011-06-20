# Getting Started

Clone this (or a forked version of this) repository.

    $ cd ~
    $ git clone https://rmm5t@github.com/rmm5t/dotfiles.git .dotfiles

**(Option 1)** If you'd like to symlink everything from this repository to your
home directory, run `install.rb`. This will also sync and update all the git
submodules within.

    $ cd ~/.dotfiles
    $ ./install.rb

This install script is idempotent, meaning you can run it over and over again
without fear of breaking anything. Use it as an installer or to upgrade after
merging from an upstream fork.

**(Option 2)** If you'd like to just symlink one or more configurations to your
home directory manually, you can.  If you take this approach, you'll have to
update all the git submodules manually.

    $ cd ~/.dotfiles
    $ git submodule sync
    $ git submodule update --init --recursive
    $ ln -ns emacs   ~/.emacs
    $ ln -ns emacs.d ~/.emacs.d


