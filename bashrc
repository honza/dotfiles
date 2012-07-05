DOTFILES=$HOME/dotfiles
# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------
export EDITOR='mvim -v'
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

# -----------------------------------------------------------------------------
# virtualenv
# -----------------------------------------------------------------------------
export WORKON_HOME=$HOME/Code/envs
source /usr/local/bin/virtualenvwrapper.sh

# -----------------------------------------------------------------------------
# Shortcuts
# -----------------------------------------------------------------------------
alias ls='ls -h'
alias l='ls'
alias c='echo "Use Ctrl-L"' # haha!
alias du='du -sh'
alias fn='find . -name'
alias sb='source $HOME/.bashrc'
alias f='fab'
alias fv='fab -R vagrant'
alias envs='cd $WORKON_HOME'
alias smutt="$HOME/.mutt/offlineimap_sync.sh && mutt";
alias ghcm='ghc --make -optl"-Wl,-read_only_relocs,suppress"'
# $ proxyssh user@host
alias proxyssh='ssh -D 8888 -f -C -q -N'
# Recursive sed
# alias s="find . -path './.git' -prune -o -type f -print0 | xargs -0 sed -i ''"
# alias s="find . -name '.git' -prune -o -type f -print0 | xargs -0 sed -i ''"
alias e='tar xzvf'
alias fv='fab -R vagrant'
alias gist='curl -F "sprunge=<-" http://gist.honza.ca'

# ack
alias cack='ack --type=coffee'
alias pack='ack --type=python'

# tmux
alias new='tmux new -s'


function prettyjson() {
    python -mjson.tool
}
alias goawayswapfilesyouareswapfilesidontevenneedyou='rm ~/.vim/tmp/swap/*'
alias vim='mvim -v'

function psg {
    ps auxww | grep --color=always $* | grep -v grep | sed -e 's/  */ /g' | cut -d' ' -f 2,11-
}

source $HOME/dotfiles/z/z.sh
# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------
alias gitl='git log --pretty=format:"%h - %an, %ar : %s"'
alias gits='clear; git status'
alias gitchart="git shortlog --numbered --summary"
alias gitg='git log --oneline --graph'
alias gall='git submodule foreach git pull'
alias gplo='git pull --rebase origin'
alias gpso='git push origin'

# -----------------------------------------------------------------------------
# Python & Django
# -----------------------------------------------------------------------------
alias rmpyc='find . -name "*.pyc" -exec rm {} \;'
alias m='python manage.py'
alias run='python manage.py runserver'
alias sync='python manage.py syncdb'
alias rrun="rm dev.db ; sync --noinput ; m migrate; m createsuperuser --user=honza --email=me@honza.ca; m runserver"

# -----------------------------------------------------------------------------
# todo.txt
# -----------------------------------------------------------------------------
alias t='~/dotfiles/todo.txt/todo.sh'

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/texbin
export PATH=$PATH:$HOME/.cabal/bin

# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------

# Prompt stuff
export VIRTUAL_ENV_DISABLE_PROMPT=1
function ve () {
    if [ -z "$VIRTUAL_ENV" ]; then
        echo ''
        return
    fi

    x=`basename $VIRTUAL_ENV`
    echo "$x"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/"
}

# yellow - \033[33m
# blue - \033[34m
# magenta - \033[35m
# reset - \033[m

export PS1="\033[33m\$(ve)\033[m \w \033[34m\$(parse_git_branch)\033[m $ "
export PS1="\[\033[33m\]\$(ve)\[\033[m\] \w \[\033[34m\]\$(parse_git_branch)\[\033[m\] $ "

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
# PostgreSQL
# -----------------------------------------------------------------------------
alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppostgres='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

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

# export SHELL=/usr/local/bin/bash
export GREP_OPTIONS='--color=auto'

export PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [[ -s $HOME/.bashrc_local ]] ; then source $HOME/.bashrc_local ; fi
if [[ -s $DOTFILES/bash_functions ]] ; then source $DOTFILES/bash_functions ; fi
