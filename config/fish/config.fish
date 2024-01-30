alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"
alias ix.io="curl -F 'f:1=<-' ix.io"

abbr v "nvim"
abbr g "git"
abbr tn "tmux new -s"
abbr ta "tmux attach -t"

set fish_greeting
set -x EDITOR nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
