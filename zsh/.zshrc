# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# source ~/.bin/tmuxinator.zsh
export EDITOR=/usr/local/bin/vim  
export VISUAL=/usr/local/bin/vim  
export TERM="xterm-256color"

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Aliases
alias z.c="vim ~/.zshrc"
alias s.c="mux start scotch"
alias v.c="vim ~/.vimrc"
alias t.c="vim ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"
alias perm="sudo chown -R kelvinakposoe:admin *"
alias c="clear"
alias remove="sudo rm -rf"

alias ga="sudo git add -A"
alias gm="sudo git commit -m"
alias gp="git push"

alias homestead="sudo ~/.composer/vendor/bin/homestead"
alias homestead:e="sudo vim ~/.homestead/homestead.yaml"
alias hostsconfig="sudo vim /etc/hosts"

# Scotch Box Start & Stop
alias s.up="~/Sites/wp_projects/ && sudo vagrant up"
alias s.stop="~/Sites/wp_projects/ && sudo vagrant suspend"
alias s.refresh="~/Sites/wp_projects/ && sudo vagrant provision"

alias gulp="sudo gulp"
alias t.n="tmux new -s"
alias t.k="tmux kill-session -t"
alias t.a="tmux a -t"
alias t.l="tmux ls"
alias gs="sudo git status"
alias gm="sudo git commit -m"
alias gc="sudo git checkout"
alias gcb="sudo git checkout -b"
alias gb="sudo git branch"
alias gcl="sudo git clone"

alias composer="sudo composer"
alias pha="sudo php artisan"
alias laravel="sudo ~/.composer/vendor/bin/laravel"

alias wsites="~/Sites/wp_projects"
alias theme="/wp-content/themes/"

alias ex="exit"
alias f="fzf -m | pbcopy"

# alias vim= "sudo vim -u /usr/local/Cellar/vim/7.4.488/share/vim/vim74"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
