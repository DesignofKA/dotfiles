# Aliases
alias a.c="n ~/.aliases.zsh"
alias z.c="n ~/.zshrc"
alias v.c="n ~/.vimrc"
alias t.c="n ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"
alias perm:f="sudo chown -R kelvinakposoe:admin"
alias perm:a="sudo chown -R kelvinakposoe:admin *"
alias c="clear"
alias rm="trash"
alias mv="mv"
alias copy="cp -r"
alias file="touch"
alias ex="exit"
alias x="exit"
alias f="ag -g "" | fzf -m | pbcopy"
alias oldf="fzf -m | pbcopy"
alias oldvim="/usr/local/bin/vim"
alias n="nvim"
# alias j="jobs"

function j() {
    if [[ -n "$1" ]]; then
        fg %${1}
    else
        jobs
    fi
}


alias sshc="ssh-connect"


# Folder Navigation
alias sites="~/Sites/"
alias desk="cd ~/Desktop"
alias lp="~/Sites/lara_projects"
alias ll="~/Sites/lara_lessons"
alias dots="cd ~/.dotfiles"

# Laravel Commands
alias pa="php artisan"
alias pam="php artisan migrate"
alias pam:"pha artisan migrate:refresh"
alias tinker="php artisan tinker"

# Gulp
alias g="gulp"

# Tmux & Tmuxinator
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias ta="tmux a"
alias tl="tmux ls"

# Total size of folder
alias tfu="du -sh"

# Git Commands
alias nah='git reset --hard;git clean -df'
alias ga="git add"
alias gd="git diff"
alias gpu="git pull"
alias gs="git status"
alias gm="git commit"
alias gmm="git commit -m"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gf="git fetch"
alias gcl="git clone"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gclean="git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d"

unalias gp
function gp() # Git push w/ condition to add all and push
{
    if [[ -n "$1" ]]; then
        git add -A
        git commit -m "$1"
    fi
    git push
}

function gwip()
{
    git add -A
    git commit -m 'WIP'
}

# Jigsaw Commands
alias jg="jigsaw"

# Composer Commands
alias comp="composer"
alias cgu="composer global update"
alias compr="composer require"
alias cda="composer dump-autoload"

# Todo App Commands
alias td="todo"
alias tda="todo add"
alias tdd="todo done"
alias tde="todo edit"

# HTML Boilerplate
alias addgulp=""
function addgulp()
{
    cp ~/.dotfiles/mvad/gulp/package.json ~/.dotfiles/mvad/gulp/gulpfile.js .
    yarn
    echo 'gulpfile.js\npackage-lock.js\npackage.json\nnode_modules/\n.gitignore' >> .gitignore
    echo '** Gulp env has been created **'
}

alias opu="../../../vendor/bin/phpunit"

unalias s # Unalias s from fasd
function s()
{
    if [[ -n "$1" && -n "$2" ]]; then
        ag "$1" -i **/*.$2
    elif [[ -n "$1" ]]; then
            ag "$1" -i **/*
    else
        echo 'No arguments passed for search'
    fi
}

# Folder Jumps
alias commerce='cd ~/code/mvad/ha/html/plugins/mvad/commerce'
alias hatters='cd ~/code/mvad/ha/html/'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy'
