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

# Aliases
alias a.c="n ~/.aliases.zsh"
alias z.c="n ~/.zshrc"
alias v.c="n ~/.vimrc"
alias t.c="n ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"
alias cat="bat"
alias x="exit"
alias oldvim="/usr/local/bin/vim"
alias n="nvim"
alias vr="valet restart" # Valet

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
alias tinker="php artisan tinker"

# PHP Unit Commands.
alias pu="./vendor/bin/phpunit"
alias pug="pu --group test"
alias puf="pu --filter"

# Gulp

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

# function lutail {
#     tail -n 200 storage/logs/lumen-$(date +%Y-%m-%d).log | grep -iP "\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\]"
# }

function log.c {
    echo "Clearing contents of Laravel Log File"
    echo > storage/logs/laravel*.log
}

# function wifi {
#     echo 'Restarting wifi'
#     nmcli radio wifi off
#     nmcli radio wifi on
#     echo 'Connecting to wifi'
#     sleep 3
# }

# function phpv() {
#     valet stop
#     sudo /etc/init.d/php7.0-fpm stop
#     sudo /etc/init.d/php7.1-fpm stop
#     sudo /etc/init.d/php${1}-fpm start
#     composer global update
#     valet install
# }

# alias php70="phpv 7.0"
# alias php71="phpv 7.1"

function weather()
{
    curl http://wttr.in/$1
}
