# Aliases
alias a.c="n ~/.aliases.zsh"
alias z.c="n ~/.zshrc"
alias v.c="n ~/.vimrc"
alias t.c="n ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"
alias c="clear"
alias copy="cp -r"
alias nf="touch"
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
alias sites="~/Sites/"
alias desk="cd ~/Desktop"
alias lp="~/Sites/lara_projects"
alias ll="~/Sites/lara_lessons"
alias dots="cd ~/.dotfiles"

# Laravel Commands
alias pa="php artisan"
alias pam="php artisan migrate"
alias pamr="php artisan migrate:refresh"
alias tinker="php artisan tinker"
alias pu="./vendor/bin/phpunit"

# Gulp
alias g="gulp"

# Tmux & Tmuxinator
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias ta="tmux a"
alias tl="tmux ls"

# Cat alternative
alias bat="cat"

# Total size of folder
alias total="du -sh"

# Git Commands
alias nah='git reset --hard;git clean -df'
alias ga="git add"
alias gd="git diff"
alias gpu="git pull"
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

# Todo App Commands
alias td="todo"
alias tda="todo add"
alias tdd="todo done"
alias tde="todo edit"

# HTML Boilerplate
# TODO change directory or remove
function addgulp()
{
    cp ~/.dotfiles/mvad/gulp/package.json ~/.dotfiles/mvad/gulp/gulpfile.js .
    yarn
    echo 'gulpfile.js\npackage-lock.js\npackage.json\nnode_modules/\n.gitignore' >> .gitignore
    echo '** Gulp env has been created **'
}

alias opu="../../../vendor/bin/phpunit"

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

function log.l {
    echo "Printing contents of Laravel Log File"
    echo "Press Ctrl + C to exit"
    echo "Tip: Type 'log.c' to clear contents of Laravel Log File"
    tail -f -n 450 storage/logs/laravel*.log \
  | grep -i -E \
    "^\[\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2}\]|Next [\w\W]+?\:"
}

function log.c {
    echo "Clearing contents of Laravel Log File"
    echo > storage/logs/laravel*.log
}

function nr {
    echo 'Restarting wifi'
    nmcli radio wifi off
    nmcli radio wifi on
    echo 'Connecting to wifi'
    sleep 3
    nmcli dev wifi connect Mvad24 password murphyvarley1
}

function ftp.up {
    echo '### Starting FTP Server ###'
    info=$(sudo docker container ls -a | grep -m 1 stilliard)
    [[ $info =~ '^(\w+)' ]] && container=$match[1]
    start='sudo docker start $container 2>&1'
    echo 'Completed'
}

function ftp.down {
    echo '### Stopping FTP Server ### '
    info=$(sudo docker container ls -a | grep -m 1 stilliard)
    [[ $info =~ '^(\w+)' ]] && container=$match[1]
    stop='sudo docker container stop $container 2>&1'
    echo 'Completed'
}

function phpv() {
    valet stop
    sudo /etc/init.d/php7.0-fpm stop
    sudo /etc/init.d/php7.1-fpm stop
    sudo /etc/init.d/php${1}-fpm start
    composer global update
    valet install
}

alias php70="phpv 7.0"
alias php71="phpv 7.1"
