#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# Requires git and Dropbox

set -e
set -u

DOTFILES=$HOME/dotfiles
DROPBOX=$HOME/Dropbox
CODE=$HOME/Code
GITHUB=$HOME/Github

if [ ! -d "$CODE" ]; then
    mkdir $CODE
fi

if [ ! -d "$GITHUB" ]; then
    mkdir $GITHUB
fi

# git submodule init
# git submodule update

echo "Installing pip and virtualenv..."
# sudo easy_install pip
# sudo pip install virtualenv virtualenvwrapper

# rc files
# ln -s $DOTFILES/vimrc $HOME/.vimrc
# ln -s $DOTFILES/vim $HOME/.vim
# ln -s $DOTFILES/bashrc $HOME/.bashrc
# ln -s $DOTFILES/ackrc $HOME/.ackrc

# # ssh
# ln -s $DROPBOX/SSH/config $HOME/.ssh/config
# cp $DROPBOX/SSH/honza $HOME/.ssh/honza
# cp $DROPBOX/SSH/honza.pub $HOME/.ssh/honza.pub

# # git
# ln -s $DROPBOX/SSH/gitconfig $HOME/gitconfig

# cd $GITHUB && git clone git://github.com/joyent/node.git
# cd $GITHUB/node && ./configure && make && make install

npm install -g coffee-script
npm install -g uglify-js

source $HOME/.bashrc
