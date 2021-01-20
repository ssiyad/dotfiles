#!/bin/bash

TERM=kitty

function bemenu_show {
    printf "$@" | bemenu -i --fn "Fira Code 9" --nb "#242c34" --nf "#dfdfdf" --tb "#444444" --tf "#dfdfdf" --fb "#242c34" --ff "#ffcd1a" --hb "#242c34" --hf "#8734ff"
}

function go-pass {
    wl-copy $(gopass show -o $(bemenu_show "$(gopass list --flat)"))
    notify-send "gopass" "password copied to clipboard"
}

function ss-full {
    dest="$HOME/Screenshots/$(date '+%F-%T-%a')_full.png"
    grim $dest
    wl-copy $dest
    notify-send "grim" "full screenshot saved as $dest"
}

function ss-window {
    dest="$HOME/Screenshots/$(date '+%F-%T-%a')_window.png"
    grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" $dest
    wl-copy $dest
    notify-send "grim" "window screenshot saved as $dest"
}

function ss-partial {
    dest="$HOME/Screenshots/$(date '+%F-%T-%a')_partial.png"
    grim -g "$(slurp)" $dest
    wl-copy $dest
    notify-send "grim" "partial screenshot saved as $dest"
}

function screenshot {
    choice=$(bemenu_show "ss-full\nss-window\nss-partial")
    $choice
}

function music {
    choice=$(bemenu_show "prev\nnext\npause\nplay")
    res=$(mpc $choice)
    echo $res
    notify-send "music" "$res"
}

function movies {
    choice=$(bemenu_show "$(ls ~/Movies)")
    [[ -z $choice ]] && exit 0
    mpv "$HOME/Movies/$choice"
}

function manual {
    choice=$(bemenu_show "")
    $TERM man $choice
}

function public-ip {
    notify-send "ip" "public ip is $(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '\"')"
}

function browser {
    url=$(bemenu_show "")
    [[ -z $url ]] && exit 0
    qutebrowser --target window "$url"
}

function clipboard {
    wl-copy $(bemenu_show "$(tac /tmp/clipboard)")
}

choice=$(bemenu_show "go-pass\nscreenshot\nclipboard\nbrowser\nmusic\nmovies\nmanual\npublic-ip")
[[ -z $choice ]] && exit 0
$choice
