#!/usr/bin/env sh

export PATH=/usr/texbin:/usr/local/Cellar/ruby/2.0.0-p0/bin:/bin:/usr/sbin:/sbin:/usr/bin

./configure \
            --enable-perlinterp \
            --enable-pythoninterp \
            --enable-rubyinterp \
            --enable-cscope \
            --with-features=huge

make
make install
