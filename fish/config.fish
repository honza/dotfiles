set BROWSER open
set -g -x fish_greeting ''
set -g -x EDITOR vim
set -g -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"
# set -g -x WORKON_HOME "$HOME/Code/envs"
set -g -x VIRTUALFISH_HOME "$HOME/Code/envs"
set -g -x VIRTUALFISH_COMPAT_ALIASES 1

set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1
. ~/.config/fish/virtual.fish
. ~/.config/fish/local.fish

alias l 'ls'
alias ll 'ls -alh'
alias d 'du -sh'
alias fn 'find . -name'
alias sb '. $HOME/.config/fish/config.fish'
alias f 'fab'
alias fv 'fab -R vagrant'
alias envs 'cd $WORKON_HOME'
alias ghcm 'ghc --make -optl"-Wl,-read_only_relocs,suppress"'
alias proxyssh 'ssh -D 8888 -f -C -q -N'
alias e 'tar xzvf'
alias fv 'fab -R vagrant'
alias gist 'curl -F "sprunge=<-" http://gist.honza.ca'
alias copy 'pbcopy'
alias fin "vim $HOME/Dropbox/Documents/finances.b"
alias total "node $HOME/Dropbox/Code/budget.js/b.js $HOME/Dropbox/Documents/finances.b"
alias sub "subliminal -l en"
alias el "echo 'Eliška' | pbcopy"

function rgrep
    grep -ir $argv *
end

# ack
alias cack 'ack --type=coffee'
alias pack 'ack --type=python'

alias offline 'offlineimap -qf INBOX; notmuch new'
alias ios 'open -a "iPhone Simulator.app"'

# tmux
alias tm 'tmux -u2'
alias new 'tmux new -s'
alias att 'tmux attach -t'

alias prettyjson "python -mjson.tool"

# Run a command and notify me when it's done
# e.g. $ grr vagrant up
function grr
    eval $argv
    terminal-notifier -title "Finished" -message "'$argv' finished" >> /dev/null
end

# -----------------------------------------------------------------------------
# Vagrant
# -----------------------------------------------------------------------------
alias vu 'vagrant up'
alias vs 'vagrant ssh'
alias vh 'vagrant halt'
alias vss 'vagrant status'

# -----------------------------------------------------------------------------
# Vim
# -----------------------------------------------------------------------------
alias ef 'vim ~/.config/fish/config.fish'
alias v 'vim'
alias ev 'vim ~/.vimrc'
alias goawayswapfilesyouareswapfilesidontevenneedyou 'rm ~/.vim/tmp/swap/*'

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------
alias g 'git'
alias gitl "git log --pretty=format:'%h - %an, %ar : %s'"
alias gits 'clear; git status'
alias gitchart "git shortlog --numbered --summary"
alias gitg 'git log --oneline --graph'
alias gall 'git submodule foreach git pull origin master'

# -----------------------------------------------------------------------------
# Python & Django
# -----------------------------------------------------------------------------
alias rmpyc 'find . -name "*.pyc" -exec rm "{}" \;'
alias m 'python manage.py'
alias run 'python manage.py runserver'
alias sync 'python manage.py syncdb'

alias cuts "cut -d' '"
alias collapse="sed -e 's/  */ /g'"

function psg -d "Grep for a running process, returning its PID and full string"
    ps auxww | grep --color=always $argv | grep -v grep | collapse | cuts -f 2,11-
end

set -gx GREP_OPTIONS '--color=auto'

function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end


set -gx PATH "/usr/bin"

prepend_to_path "/sbin"
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/share/python"
prepend_to_path "/usr/local/sbin"
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/dotfiles"
prepend_to_path "$HOME/dotfiles/bin"
prepend_to_path "$HOME/.cabal/bin"
prepend_to_path "/opt/local/bin"
prepend_to_path "/usr/local/Cellar/ruby/2.0.0-p0/bin"
prepend_to_path "/Applications/Postgres.app/Contents/MacOS/bin"
prepend_to_path "/usr/texbin"


# Prompt {{{

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)
set hg_promptstring "< on $magenta<branch>$normal>< at $yellow<tags|$normal, $yellow>$normal>$green<status|modified|unknown><update>$normal<
patches: <patches|join( → )|pre_applied($yellow)|post_applied($normal)|pre_unapplied($gray)|post_unapplied($normal)>>" 2>/dev/null

function virtualenv_prompt
    if [ -n "$VIRTUAL_ENV" ]
        printf '(%s)' (basename "$VIRTUAL_ENV")
    end
end

function hg_prompt
    hg prompt --angle-brackets $hg_promptstring 2>/dev/null
end

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s ' (git currentbranch ^/dev/null)
        set_color normal
    end
end

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|"
end

function fish_prompt
    set_color normal

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    git_prompt

    set_color blue
    virtualenv_prompt
    set_color normal

    echo " \$ "
end
