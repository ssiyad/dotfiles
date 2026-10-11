# Bootstrap fisher + install plugins from fish_plugins on a fresh machine.
if status is-interactive; and not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher update
end

fish_config theme choose "Acid Acetic"

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

fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

# Set history location to avoid mixing host and container history.
if test -f /run/.containerenv
    set -l cname (cat /run/.containerenv | grep '^name=' | cut -d'"' -f2 | sed 's/-/_/')
    set -x fish_history "$cname"
end

# Auto start niri-session on tty1.
if status is-login; and status is-interactive; and test (tty) = "/dev/tty1"
    # Check if niri-session is already running for the current user, and start it if not.
    if not pgrep -xu (whoami) niri-session >/dev/null
        exec niri-session
    end
end
