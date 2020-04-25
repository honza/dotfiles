set -e GREP_OPTIONS
set BROWSER open

set -g -x SHELL /bin/fish
set -g -x fish_greeting ''
set -g -x EDITOR vim
set -g -x VIRTUALFISH_HOME "$HOME/code/envs"
set -g -x VIRTUALFISH_COMPAT_ALIASES 1
set -g -x GOPATH "$HOME/code/go"
set -g -x KEYID "0xFFBD0899F2AD6A2B"
set -g -x ANSIBLE_NOCOWS 1
set -g -x TAR_OPTIONS '--one-top-level'
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -g -x LEIN_GPG gpg2  # yes, in 2017
set -g -x PYENV_ROOT "$HOME/.pyenv"

alias l 'ls -1'
alias ll 'ls -alh'
alias lt 'ls -1tr'
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


function p
  if count $argv > /dev/null
    pannote $HOME/Dropbox/Notes $argv | fpp
  else
    echo 'Usage: p <term>'
  end
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
# Emacs
# -----------------------------------------------------------------------------
alias em 'emacsclient -nc'
alias ef 'emacsclient -nc ~/.config/fish/config.fish'

if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

# -----------------------------------------------------------------------------
# Vim
# -----------------------------------------------------------------------------
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
    ps auxww | grep $argv | grep -v grep | collapse | cuts -f 2,11-
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
prepend_to_path "$HOME/.pyenv/bin"
prepend_to_path $GOPATH/bin

# These exports are necessary for compiling and running sway
set -gx PKG_CONFIG_PATH /usr/local/lib/pkgconfig /usr/local/lib64/pkgconfig /usr/local/share/pkgconfig $PKG_CONFIG_PATH
set -gx LD_LIBRARY_PATH /usr/local/lib/ /usr/local/lib64/ $LD_LIBRARY_PATH

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function virtualenv_prompt
    if [ -n "$VIRTUAL_ENV" ]
        printf '(%s)' (basename "$VIRTUAL_ENV")
    end
end

function git_prompt
    set -l branch_name (command git symbolic-ref --short HEAD ^/dev/null)

    if test -n "$branch_name"
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s ' "$branch_name"
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

function move_to_movies
    mv $argv /Volumes/Drive/movies/.
end

alias reindex "ssh silo '/usr/syno/bin/synoindex -R /volume1/video'"

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
