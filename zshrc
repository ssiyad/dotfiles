export ZSH="/home/ssiyad/.oh-my-zsh"

ZSH_THEME="sunrise"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    git
    git-extras
    sudo
    extract
    python
    wd
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

export ARCHFLAGS="-arch x86_64"

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="gir diff"
alias gco="git checkout"
alias gcl="git clean -df"
alias gdiff="git difftool HEAD"
alias gpl="git pull"
alias gps="git push"
alias gs="git status"
alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias bc="bc -lq"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cl="clear -x"
alias r="ranger"
alias n="ncmpcpp"
alias htop="htop -t"
alias cp="cp -rv"
alias icat="kitty +kitten icat --silent"
alias dif="kitty +kitten diff"
alias ix.io="curl -F 'f:1=<-' ix.io <"

# Additional env
export PATH="/home/ssiyad/.gem/ruby/2.6.0/bin:$PATH"
export TERM=xterm-256color
