# Path to your oh-my-zsh installation.
source ~/.bin/tmuxinator.zsh

export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/local/bin/vim  
export VISUAL=/usr/local/bin/vim  
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

 #Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# User configuration

export PATH="$HOME/.composer/vendor/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"

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
alias s.c="mux start scotch"
alias v.c="n ~/.vimrc"
alias t.c="n ~/.tmux.conf"
alias z.r=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias t.r="tmux source-file ~/.tmux.conf"
alias pf="sudo chown -R kelvinakposoe:admin"
alias upf="sudo chown -R User:admin"
alias perm.file="sudo chown -R kelvinakposoe:admin"
alias perm.all="sudo chown -R kelvinakposoe:admin *"
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
alias f-"ag -g "" | fzf -m | pbcopy"
alias oldf="fzf -m | pbcopy"
alias dotfiles="cd ~/.dotfiles"
alias desk="cd ~/Desktop"
alias sites="~/Sites/"
# alias oldvim="/usr/local/bin/vim"
alias n="nvim"
alias p="php"
alias ctags="/usr/local/bin/ctags -R ."

# Fasd Shortcuts - Requires https://github.com/clvv/fasd
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection


# Homestead Shortcuts
alias h="sudo ~/.composer/vendor/bin/homestead up"
alias h.up="sudo ~/.composer/vendor/bin/homestead up"
alias h.stop="sudo ~/.composer/vendor/bin/homestead halt"
alias h.c="sudo vim ~/.homestead/homestead.yaml"
alias hostsconfig="sudo vim /etc/hosts"

# Laravel Commands
alias composer="composer"
alias pha="sudo php artisan"
# alias laravel="~/.composer/vendor/bin/laravel"
alias valet="~/.composer/vendor/bin/valet"
alias lv="~/Sites/lara_projects"
alias lv.goodcv="lv && goodcv/public"

# Scotch Box Start & Stop
alias s.up="~/Sites/wp_projects/ && sudo vagrant up"
alias s.stop="~/Sites/wp_projects/ && sudo vagrant suspend"
alias s.refresh="~/Sites/wp_projects/ && sudo vagrant provision"

# Gulp
alias g="sudo gulp"
alias g.install

# Tmux & Tmuxinator
alias t.n="tmux new -s"
alias tn="tmux new -s"
alias t.k="tmux kill-session -t"
alias tk="tmux kill-session -t"
alias t.a="tmux a -t"
alias ta="tmux a"
alias t.l="tmux ls"
alias tl="tmux ls"
alias develop="mux start wordpress"
alias fse="mux start fse"

# Git Commands
alias ga="sudo git add -A"
alias gpu="sudo git pull"
alias gs="sudo git status"
alias gm="sudo git commit -m"
alias gc="sudo git checkout"
alias gcb="sudo git checkout -b"
alias gb="sudo git branch"
alias gcl="sudo git clone"
alias gl="sudo git log --oneline --decorate --all --graph"

# HTML Boilerplate
alias html="gcl https://github.com/DesignofKA/HTML5-Starter"
alias html.here="gcl https://github.com/DesignofKA/HTML5-Starter ."

# Wordpress Shortcuts
alias wsites="~/Sites/wp_projects"
alias ws="~/Sites/wp_projects"
alias ws.wordjar="ws && wordjar.dev/public"
alias ws.designofka="ws && designofka.dev/public"
alias theme="/wp-content/themes/"

# Phploy Shortcuts
alias px="Phploy"
alias pxi="Phploy --init"
alias pxl="Phploy -l"
alias pxs="Phploy --sync"
alias push="gp && px"
# YCM Compile
alias ycm.compile="cd ~/.vim/plugged/YouCompleteMe && ./install.sh --clang-completer"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# - zz - will center the screen based on the line your on
# source zsh-snippets/snippets.plugin.zsh
