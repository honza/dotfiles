#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# Requires Dropbox
# This should be run from the default login shell

set -e

# Treat unset variables as an error when performing parameter expansion. An
# error message will be written to the standard error, and a non-interactive
# shell will exit.
set -u

DOTFILES=$HOME/dotfiles
DROPBOX=$HOME/Dropbox
CODE=$HOME/Code
GITHUB=$HOME/Github

mkdir -p $CODE
mkdir -p $GITHUB

echo "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
export PATH=/usr/local/bin:$PATH

echo "Installing all the homebrew things..."
brew install ack autoconf automake cmake contacts ctags ffmpeg fishfish git gnu-tar gnu-typist gnupg go haskell-platform iftop irssi mercurial mobile-shell msmtp nettle openssl reattach-to-user-namespace ruby tmux tree unrar urlview wget xapian xz
brew install mutt --with-sidebar-patch

echo "Updating submodules..."
git submodule init
git submodule update

echo "Installing Python..."
brew install python --framework

echo "Installing pip and virtualenv..."
easy_install pip
pip install virtualenv virtualenvwrapper fabric pep8 flake8 subliminal pytmux

# rc files
ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/vim $HOME/.vim
ln -s $DOTFILES/bashrc $HOME/.bashrc
ln -s $DOTFILES/ackrc $HOME/.ackrc

mkdir -p $HOME/.config/fish
ln -s $DOTFILES/fish/config.fish $HOME/.config/fish/config.fish
ln -s $DOTFILES/fish/virtual.fish $HOME/.config/fish/virtual.fish

mkdir -p $DOTFILES/vim/tmp/swap
mkdir -p $DOTFILES/vim/tmp/backup
mkdir -p $DOTFILES/vim/tmp/undo

# # ssh
mkdir $HOME/.ssh
ln -s $DROPBOX/keys/config $HOME/.ssh/config
cp $DROPBOX/keys/honza $HOME/.ssh/honza
cp $DROPBOX/keys/honza.pub $HOME/.ssh/honza.pub

# # git
ln -s $DROPBOX/keys/gitconfig $HOME/.gitconfig

source $HOME/.config/fish/config.fish

cd $GITHUB && git clone git://github.com/joyent/node.git
cd $GITHUB/node && ./configure && make && make install

cd $GITHUB && hg clone https://vim.googlecode.com/hg/ vim
cp $DOTFILES/compile-vim.sh $GITHUB/vim/compile-vim.sh
chmod +x $GITHUB/vim/compile-vim.sh
cd $GITHUB/vim && ./compile-vim.sh

npm install -g coffee-script
npm install -g uglify-js
