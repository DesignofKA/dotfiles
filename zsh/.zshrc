export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/local/bin/nvim  
export VISUAL=/usr/local/bin/nvim  
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

fpath+=("/usr/local/share/zsh/site-functions")

source ~/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hlissner/zsh-autopair
antigen bundle andrewferrier/fzf-z
antigen bundle gko/ssh-connect
antigen bundle peterhurford/up.zsh

# Tell Antigen that you're done.
antigen apply

plugins=(git zsh-completions)

ZSH_THEME="refined"

source $ZSH/oh-my-zsh.sh
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR='nvim'

# User configuration
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH="~/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH"

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
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
