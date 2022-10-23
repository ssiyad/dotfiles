if status is-interactive
    alias mkdir="mkdir -pv"
    alias ls="ls -aFGh --color=always"
    alias rm="rm -rfv"
    alias mv="mv -iv"
    alias cp="cp -rv"
    alias ix.io="curl -F 'f:1=<-' ix.io"

    abbr v "nvim"
    abbr g "git"

    set fish_greeting

    # TokyoNight Color Palette
    set -g foreground c0caf5
    set -g selection 33467C
    set -g comment 565f89
    set -g red f7768e
    set -g orange ff9e64
    set -g yellow e0af68
    set -g green 9ece6a
    set -g purple 9d7cd8
    set -g cyan 7dcfff
    set -g pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
end

