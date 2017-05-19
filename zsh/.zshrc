export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/local/bin/nvim  
export VISUAL=/usr/local/bin/nvim  
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

fpath+=("/usr/local/share/zsh/site-functions")

plugins=(git, zsh-completions)
autoload -U compinit && compinit

ZSH_THEME="pure"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR='nvim'

# User configuration
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH"

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

# Aliases
alias z.c="n ~/.zshrc"
alias v.c="n ~/.vimrc"
alias t.c="n ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"
alias pf="sudo chown -R kelvinakposoe:admin"
alias upf="sudo chown -R User:admin"
alias upa="sudo chown -R User:admin *"
alias pa="sudo chown -R kelvinakposoe:admin *"
alias c="clear"
alias remove="sudo rm -i"
alias rf="sudo rm -rf"
alias mv="sudo mv"
alias copy="sudo cp -r"
alias file="sudo touch"
alias ex="exit"
alias x="exit"
alias f="ag -g "" | fzf -m | pbcopy"
alias oldf="fzf -m | pbcopy"
alias dotfiles="cd ~/.dotfiles"
alias desk="cd ~/Desktop"
alias sites="~/Sites/"
alias oldvim="/usr/local/bin/vim"
alias n="nvim"
alias io="imageoptim"

# Laravel Commands
alias pha="php artisan"
alias valet="valet"
alias lp="~/Sites/lara_projects"
alias ll="~/Sites/lara_lessons"

# Gulp
alias g="gulp"

# Tmux & Tmuxinator
alias tn="tmux new -s"
alias t.k="tmux kill-session -t"
alias tk="tmux kill-session -t"
alias t.a="tmux a -t"
alias ta="tmux a"
alias tl="tmux ls"
alias develop="mux start wordpress"
alias fse="mux start fse"

# Git Commands
alias ga="git add"
alias gpu="git pull"
alias gs="git status"
alias gm="git commit -m"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gcl="git clone"
alias gl="git log --oneline --decorate --all --graph"

# HTML Boilerplate
alias html="gcl https://github.com/kakposoe/HTML5-Starter"
alias html.here="gcl https://github.com/kakposoe/HTML5-Starter ."

# Phploy Shortcuts
alias px="Phploy"
alias pxi="Phploy --init"
alias pxl="Phploy -l"
alias pxs="Phploy --sync"
alias push="gp && px"

# php unit
alias unit='vendor/bin/phpunit'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start up file
source ~/.dotfiles/startup.sh

function push {
    br=`git branch | grep "*"`

    params=''
    for i in $*;
    do
        params=" $params $d$i"
    done

    git add --all
    git commit -m "$params"
    git push origin ${br/* /}
}

