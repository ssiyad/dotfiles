export ZSH="/home/ssiyad/.oh-my-zsh"

ZSH_THEME="sunrise"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    sudo
    wd
    zsh-syntax-highlighting
    zsh-autosuggestions
)

transfer(){
    if [ $# -eq 0 ];
    then
        echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;
        exit 1;
    fi;
    echo $(curl --upload-file "$1" https://transfer.sh/$1)
}

source $ZSH/oh-my-zsh.sh
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

export ARCHFLAGS="-arch x86_64"
export EDITOR=vim

alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"
alias ix.io="curl -F 'f:1=<-' ix.io"
alias emacs="emacs -nw"

source /usr/share/nvm/init-nvm.sh
