export PY_PATH="/home/linuxbrew/.linuxbrew/bin/python3"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy'

# SSH connections
alias iddrone='ssh ci@178.62.52.243'
alias idtesting='ssh root@138.68.166.97'
alias idproduction='ssh root@167.99.201.148'

alias taile='n ~/Projects/insideData/multitail.sh'

# System shortcuts
alias pack='cd ~/Projects/insideData/packages'

alias btc="~/.dotfiles/scripts/bluetooth.sh 00:18:09:1E:63:BC"
alias btd="bt-device -d 00:18:09:1E:63:BC"

function id_package_swap() {
    DIRECTORY=vendor/insidedata/

    if [ ! -d "$DIRECTORY" ]; then
        echo "Inside Data vendor directory does not exist"
        exit;
    fi

    if [ ! -d "/home/kelvin/Projects/insideData/packages/$1" ]; then
        echo "Package not found: $1"
        exit;
    fi

    echo "Changing ${1} to local version"

    cd $DIRECTORY

    if [ -d "${1}" ]; then
        rm -rf ${1}
    fi

    ln -s ~/Projects/insideData/packages/$1/ .

    cd ../../

    echo "Swap completed completed"
}
