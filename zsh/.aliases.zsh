# Start fasd
eval "$(fasd --init auto)"

if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  alias v='f -e vim'
  alias o='a -e open_command'
fi

# Configuration Aliases
alias a.c="n ~/.aliases.zsh"
alias aa.c="n ~/.aliases-additions.zsh"
alias z.c="n ~/.zshrc"
alias v.c="n ~/.vimrc"
alias t.c="n ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"

alias cat="bat"
alias x="exit"
alias n="nvim"
alias mk="mkdir"

# Docker
alias d.e="docker-compose exec app bash"
alias d.up="docker-compose up -d"
alias d.build="docker-compose up -d --build"
alias d.stop="docker-compose stop"
alias d.l="docker ps"

# NPM
alias nrp="npm run production"
alias nrw="npm run watch"

# Valet
alias vr="valet restart"

# List jobs or bring to foreground
function j() {
    if [[ -n "$1" ]]; then
        fg %${1}
    else
        jobs
    fi
}

# Folder Navigation
alias dots="cd ~/.dotfiles"

# Laravel Commands
unalias a # Unalias a from fasd
alias a="php artisan"
alias acc="php artisan cache:clear"
alias am="php artisan migrate"
alias amr="php artisan migrate:refresh"
alias amc="php artisan make:controller"
alias amm="php artisan make:migration"

function arl()
{
    if [[ -n "$1" ]]; then
        php artisan route:list | grep $1
    else
        php artisan route:list
    fi
}

alias tinker="php artisan tinker"

# PHP Unit Commands.
alias pu="./vendor/bin/phpunit"
alias pug="pu --group test"
alias puf="pu --filter"

# Pest Commands
alias p="./vendor/bin/pest"
alias pg="./vendor/bin/pest --group=$1"

# Tmux & Tmuxinator
alias ts="tmuxinator start"
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias ta="tmux a"
alias tl="tmux ls"

# Ping alternative
alias ping="prettyping --nolegend"

# Total size of folder
alias total="du -sh"

# Git Commands
alias nah='git reset --hard;git clean -df'
alias g="git status --short"
alias ga="git add"
alias gd="git diff"
alias gpu="git pull"
alias gph="git push -u origin HEAD"
alias gs="git status --short"
alias gm="git commit"
alias gmm="git commit -m"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcbf="git checkout -b feature\/$1"
alias gb="git branch"
alias gf="git fetch"
alias gcl="git clone"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gclean="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"

unalias l
alias l="colorls -a -l --sd"

unalias gp
function gp() # Git push w/ condition to add all and push
{
    if [[ -n "$1" ]]; then
        git add -A
        git commit -m "$1"
    fi
    git push
}

function gr() # Git push w/ condition to add all and push
{
    if [[ -n "$1" ]]; then
        git remote set-url $1 $2
    else
        git remote -v
    fi
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

# Remove zcompdump git definitions file
function z.rf()
{
    rm -rf ~/.zcompdump ~/.antigen/.zcompdump ~/.antigen/.zcompdump.zwc
    exec zsh -l
}

# FASD
# Function used to jump in and out of n/vim using ctrl-z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


unalias s # Unalias s from fasd
function s()
{
    if [[ -n "$1" ]]; then
        if [[ -n "$1" && -n "$2" ]]; then
            ag -i -G "\.$2" "$1"
        else
            ag "$1" -i *
        fi
    else
        echo 'No arguments passed for search'
    fi
}

unalias f # Unalias s from fasd
function f()
{
    find . -iname $1 -type f
}

function log.c {
    echo "Clearing contents of Laravel Log File"
    echo > storage/logs/laravel*.log
}

function weather()
{
    curl http://wttr.in/$1
}

# function phpv() {
#     valet stop
#     sudo /etc/init.d/php7.0-fpm stop
#     sudo /etc/init.d/php7.1-fpm stop
#     sudo /etc/init.d/php${1}-fpm start
#     composer global update
#     valet install
# }

alias 7.3='{ brew unlink php@7.4; brew link php@7.3 --force --overwrite; } &> /dev/null && php -v'
alias 7.4='{ brew unlink php@7.3; brew link php@7.4 --force --overwrite; } &> /dev/null && php -v'
