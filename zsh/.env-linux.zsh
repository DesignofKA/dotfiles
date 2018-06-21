export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export PATH="$HOME/.cargo/bin:~/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$HOME/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

/usr/bin/setxkbmap -option 'caps:ctrl_modifier'⏎
/usr/bin/xcape -e 'Caps_Lock=Escape' -t 100

alias 3.c="n ~/.i3/config"
alias 3.r="i3-msg reload"
alias p.c="n ~/.config/polybar/config"
