# virtualenv
export WORKON_HOME=~/Code/envs
source /usr/local/bin/virtualenvwrapper.sh
alias envs='cd ~/Code/envs'

# Git
alias gitl='git log --pretty=format:"%h - %an, %ar : %s"'
alias gits='clear; git status'
alias gitchart="git shortlog --numbered --summary"
alias gitg='git log --oneline --graph'

alias githonza='git init; rm .git/config; cd .git; cp ~/honzagit config; cd ..;'

alias rmpyc='find . -name "*.pyc" -exec rm {} \;'
alias github='cd ~/Downloads/github'

alias l='ls'
alias c='clear'
alias sb='source ~/.bashrc'

alias m='python manage.py'
alias run='python manage.py runserver'
alias sync='python manage.py syncdb'
alias rrun="rm dev.db ; sync --noinput ; m migrate; python generate.py ; m createsuperuser --user=honza --email=me@honza.ca; m runserver"

alias mlite='mv settings_local.py set.py; rm *.pyc'
alias mmysql='mv set.py settings_local.py; rm *.pyc'

# app engine
alias py25='/opt/local/bin/python2.5'
alias gaedev='py25 /usr/local/google_appengine/dev_appserver.py'

# todo.txt
alias t='~/.todo.sh'

# clitwi
alias n='python ~/.clitwi/main.py | less'

# random fixes
#PATH=/Applications/MAMP/Library/bin:$PATH
export PATH=/usr/local/bin:$PATH
#export PATH=/opt/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/Library/PostgreSQL/9.0/bin
export PATH=$PATH:/Users/norex/Code/scripts
export PATH=$PATH:/usr/texbin

export NODE_PATH="/Users/norex/node_modules"

# ssh
alias sshw='mv ~/.ssh/id_* ~/.ssh/home/. ; mv ~/.ssh/known* ~/.ssh/home/. ; mv ~/.ssh/work/* ~/.ssh/. ;'
alias sshh='mv ~/.ssh/id_* ~/.ssh/work/. ; mv ~/.ssh/known* ~/.ssh/work/. ; mv ~/.ssh/home/* ~/.ssh/. ;'

# Rename file extension
# Usage: rn txt rst
function rn {
    for f in $(find . -name "*$1");
    do 
        mv $f `echo $f | sed 's/txt$/rst/'`
    done;
}

# latex templates
function lt {
    loc=~/Dropbox/Templates/
    if [ $1 ]
    then
        if [ $1 == "simple" ]
        then
            p="$loc"simple.tex
        elif [ $1 == "letter" ]
        then
            p="$loc"letter.tex
        else
            echo "don't know this type"
        fi
        cp $p .
    else
        echo "You need an argument. Either 'simple' or 'letter'."
        return
    fi
}

# include project specific aliases
source ~/.bash_projects

export CLICOLOR=1
export LSCOLORS=DxBAcxdxCxegedabagacBA
export PS1='$ '

export NARWHAL_ENGINE=jsc

export PATH="/usr/local/narwhal/bin:$PATH"

export CAPP_BUILD="/Users/honza/Downloads/github/cappuccino/Build"
alias pg='pg_ctl -D /usr/local/var/postgres'
