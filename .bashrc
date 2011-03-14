# virtualenv
export WORKON_HOME=~/Documents/workspace/envs
source /usr/local/bin/virtualenvwrapper.sh
alias envs='cd ~/Documents/workspace/envs'

# Git
alias gitl='git log --pretty=format:"%h - %an, %ar : %s"'
alias gits='clear; git status'
alias gitchart="git shortlog --numbered --summary"
alias gitg='git log --oneline --graph'

alias githonza='git init; rm .git/config; cd .git; cp ~/honzagit config; cd ..;'

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

# random fixes
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib
PATH=/Applications/MAMP/Library/bin:$PATH
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/local/sbin

# ssh
alias sshw='mv ~/.ssh/id_* ~/.ssh/home/. ; mv ~/.ssh/known* ~/.ssh/home/. ; mv ~/.ssh/work/* ~/.ssh/. ;'
alias sshh='mv ~/.ssh/id_* ~/.ssh/work/. ; mv ~/.ssh/known* ~/.ssh/work/. ; mv ~/.ssh/home/* ~/.ssh/. ;'

# include project specific aliases
source ~/.bash_projects

export CLICOLOR=1
export LSCOLORS=DxBAcxdxCxegedabagacBA
