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
    pyenv
    python
    wd
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

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
alias ls="ls -aFG --color=always"
alias bc="bc -lq"

# Additional paths
export PATH="/home/ssiyad/.gem/ruby/2.6.0/bin:$PATH"
export TERM=xterm-256color
