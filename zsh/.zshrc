export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.env.zsh ] && source ~/.env.zsh

ZSH_THEME="refined"

fpath+=("/usr/local/share/zsh/site-functions")

source ~/antigen.zsh

antigen bundle git # Bundles from the default repo (robbyrussell's oh-my-zsh).

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hlissner/zsh-autopair
antigen bundle andrewferrier/fzf-z
antigen bundle gko/ssh-connect
antigen bundle peterhurford/up.zsh
antigen bundle laurenkt/zsh-vimto

antigen apply # Tell Antigen that you're done.

plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

bindkey -v # Add Vim 
export KEYTIMEOUT=1

# Aliases
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/.env-aliases.zsh ] && source ~/.env-aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
