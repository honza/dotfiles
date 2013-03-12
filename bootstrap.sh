#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# Requires Dropbox
# This should be run from the default login shell

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

echo "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
export PATH=/usr/local/bin:$PATH

echo "Installing git..."

echo "Installing all the homebrew things..."
brew install ack autoconf automake cmake contacts ctags emacs ffmpeg fishfish git gnu-tar gnu-typist gnupg go haskell-platform iftop irssi mercurial mobile-shell msmtp nettle openssl reattach-to-user-namespace ruby tmux tree unrar urlview wget xapian xz
brew install mutt --with-sidebar-patch

echo "Updating submodules..."
git submodule init
git submodule update

echo "Installing Python..."
brew install python --framework

echo "Installing pip and virtualenv..."
easy_install pip
pip install virtualenv virtualenvwrapper fabric pep8

# rc files
ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/vim $HOME/.vim
ln -s $DOTFILES/bashrc $HOME/.bashrc
ln -s $DOTFILES/ackrc $HOME/.ackrc

mkdir -p $DOTFILES/vim/tmp/swap
mkdir -p $DOTFILES/vim/tmp/backup
mkdir -p $DOTFILES/vim/tmp/undo

# # ssh
mkdir $HOME/.ssh
ln -s $DROPBOX/SSH/config $HOME/.ssh/config
cp $DROPBOX/SSH/honza $HOME/.ssh/honza
cp $DROPBOX/SSH/honza.pub $HOME/.ssh/honza.pub

# # git
ln -s $DROPBOX/SSH/gitconfig $HOME/.gitconfig

source $HOME/.bashrc

cd $GITHUB && git clone git://github.com/joyent/node.git
cd $GITHUB/node && ./configure && make && make install

npm install -g coffee-script
npm install -g uglify-js
