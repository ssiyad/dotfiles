PROMPT='--- %F{226}%~%f -> '

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export ARCHFLAGS="-arch x86_64"
export EDITOR=nvim
export PIPENV_VENV_IN_PROJECT=1

alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"
alias ix.io="curl -F 'f:1=<-' ix.io"
alias emacs="emacs -nw"
alias code="code-oss --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias vim="nvim"
