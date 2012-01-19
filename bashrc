# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------
export EDITOR='vim'
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

# -----------------------------------------------------------------------------
# virtualenv
# -----------------------------------------------------------------------------
export WORKON_HOME=~/Code/envs
source /usr/local/bin/virtualenvwrapper.sh

# -----------------------------------------------------------------------------
# Shortcuts
# -----------------------------------------------------------------------------
alias ls='ls -h'
alias l='ls'
alias c='echo "Use Ctrl-L"' # haha!
alias du='du -sh'
alias fn='find . -name'
alias sb='source ~/.bashrc'
alias f='fab'
alias fv='fab -R vagrant'
alias envs='cd ~/Code/envs'
# Recursive sed
# alias s="find . -path './.git' -prune -o -type f -print0 | xargs -0 sed -i ''"
alias s="find . -name '.git' -prune -o -type f -print0 | xargs -0 sed -i ''"
alias e='tar xzvf'
alias fv='fab -R vagrant'

function prettyjson() {
    python -mjson.tool
}
alias dv='dvtm -m "^f"'
alias goawayswapfilesyouareswapfilesidontevenneedyou='rm ~/.vim/tmp/swap/*'

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------
alias gitl='git log --pretty=format:"%h - %an, %ar : %s"'
alias gits='clear; git status'
alias gitchart="git shortlog --numbered --summary"
alias gitg='git log --oneline --graph'
alias gall='git submodule foreach git pull'

# -----------------------------------------------------------------------------
# Python & Django
# -----------------------------------------------------------------------------
alias rmpyc='find . -name "*.pyc" -exec rm {} \;'
alias m='python manage.py'
alias run='python manage.py runserver'
alias sync='python manage.py syncdb'
alias rrun="rm dev.db ; sync --noinput ; m migrate; python generate.py ; m createsuperuser --user=honza --email=me@honza.ca; m runserver"

# -----------------------------------------------------------------------------
# todo.txt
# -----------------------------------------------------------------------------
alias t='~/dotfiles/todo.txt/todo.sh'

# -----------------------------------------------------------------------------
# clitwi
# -----------------------------------------------------------------------------
alias n='python ~/.clitwi/main.py | less'

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/texbin

# -----------------------------------------------------------------------------
# ssh
# -----------------------------------------------------------------------------
alias sshw='mv ~/.ssh/id_* ~/.ssh/home/. ; mv ~/.ssh/known* ~/.ssh/home/. ; mv ~/.ssh/work/* ~/.ssh/. ;'
alias sshh='mv ~/.ssh/id_* ~/.ssh/work/. ; mv ~/.ssh/known* ~/.ssh/work/. ; mv ~/.ssh/home/* ~/.ssh/. ;'

# -----------------------------------------------------------------------------
# LaTex
# -----------------------------------------------------------------------------
function rn {
    # Rename file extension
    # Usage: rn txt rst
    for f in $(find . -name "*$1");
    do
        mv $f `echo $f | sed 's/txt$/rst/'`
    done;
}

# templates
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

# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------

export CLICOLOR=1
export LSCOLORS=DxBAcxdxCxegedabagacBA

# Prompt stuff
export VIRTUAL_ENV_DISABLE_PROMPT=1
ve () {
    if [ -z "$VIRTUAL_ENV" ]; then
        echo ''
        return
    fi

    x=`basename $VIRTUAL_ENV`
    echo "($x)"

}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/"
}

export PS1="\$(ve) \w \$(parse_git_branch) $ "

# -----------------------------------------------------------------------------
# Notifiers
# -----------------------------------------------------------------------------
function grr() {
    $*
    growlnotify -m "'$*' finished"
}

function spp() {
    $*
    say "'$*' finished"
}

# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# -----------------------------------------------------------------------------
# Other
# -----------------------------------------------------------------------------

# Stop telling me I have new mail
unset MAILCHECK

export PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# -----------------------------------------------------------------------------
# Project specific, if available
# -----------------------------------------------------------------------------
if [[ -s $HOME/.bashrc_local ]] ; then source $HOME/.bashrc_local ; fi
