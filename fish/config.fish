set BROWSER open

set -g -x fish_greeting ''
set -g -x EDITOR vim
set -g -x VIRTUALFISH_HOME "$HOME/code/envs"
set -g -x VIRTUALFISH_COMPAT_ALIASES 1
set -g -x GOPATH "$HOME/code/go"
set -g -x KEYID "0xFFBD0899F2AD6A2B"
set -g -x ANSIBLE_NOCOWS 1
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1

. ~/.config/fish/virtual.fish

alias l 'ls -1'
alias ll 'ls -alh'
alias d 'du -sh'
alias fn 'find . -name'
alias sb '. $HOME/.config/fish/config.fish'
alias envs 'cd $WORKON_HOME'
alias e 'tar xzvf'
alias copy 'xsel --clipboard --input'
alias paste 'xsel --clipboard --output'
alias sub "subliminal download -l en -s --"
alias el "echo 'Eliška' | xsel --clipboard --input"
alias myip "dig +short myip.opendns.com @resolver1.opendns.com"
alias cd.. "cd .."


# TODO: currently broken
function p
    pannote $HOME/Dropbox/Notes $argv | fpp
end

# tmux
alias tm 'tmux -u2'
alias new 'tmux new -s'
alias att 'tmux attach -t'

alias prettyjson "python -mjson.tool"

# Run a command and notify me when it's done
# e.g. $ notify vagrant up
function notify
    eval $argv
    notify-send "Finished" "'$argv' finished"
end

# -----------------------------------------------------------------------------
# Vim
# -----------------------------------------------------------------------------
alias ef 'vim ~/.config/fish/config.fish'
alias v 'vim'
alias ev 'vim ~/.vimrc'

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------
alias g 'git'
alias gits 'clear; git status'

# -----------------------------------------------------------------------------
# Python
# -----------------------------------------------------------------------------
alias rmpyc 'find . -name "*.pyc" -exec rm "{}" \;'

alias cuts "cut -d' '"
alias collapse="sed -e 's/  */ /g'"

function psg -d "Grep for a running process, returning its PID and full string"
    ps auxww | grep --color=always $argv | grep -v grep | collapse | cuts -f 2,11-
end

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
prepend_to_path "/usr/local/sbin"
prepend_to_path $JAVA_HOME/bin
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/.local/bin"
prepend_to_path "$HOME/dotfiles"
prepend_to_path "$HOME/dotfiles/bin"
prepend_to_path "$HOME/.cargo/bin"
prepend_to_path $GOPATH/bin

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

function cabal_prompt
    if [ -e "cabal.sandbox.config" ]
        printf '(cabal sandbox)'
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
    cabal_prompt
    set_color normal

    echo " \$ "
end

function move_to_movies
    mv $argv /Volumes/Drive/movies/.
end
