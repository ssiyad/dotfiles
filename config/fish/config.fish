if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR nvim

alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"
alias ix.io="curl -F 'f:1=<-' ix.io"
alias vim='nvim'
alias v='nvim'

if status is-login
    if test -z "$DISPLAY" -a "$(tty)" = "/dev/tty1"
        exec sway
    end
end

