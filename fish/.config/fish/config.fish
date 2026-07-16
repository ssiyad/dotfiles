alias mkdir="mkdir -pv"
alias ls="ls -aFh --color=auto"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"

abbr v "nvim"
abbr g "git"

set fish_greeting
set -x EDITOR nvim

# Vi key bindings (mode indicator lives in fish_mode_prompt)
set -g fish_key_bindings fish_vi_key_bindings

fish_add_path ~/.local/bin

# Bootstrap fisher + install plugins from fish_plugins on a fresh machine
if status is-interactive; and not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher update
end
