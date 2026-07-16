alias mkdir="mkdir -pv"
alias ls="ls -aFh --color=auto"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"

abbr v "nvim"
abbr g "git"

set fish_greeting
set -x EDITOR nvim

fish_add_path ~/.local/bin

# Bootstrap fisher + install plugins from fish_plugins on a fresh machine
if status is-interactive; and not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher update
end
