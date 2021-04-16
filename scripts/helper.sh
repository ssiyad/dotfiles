#!/bin/bash

TERM=kitty

function bemenu_show {
    printf "$@" | bemenu -i -l 13 --fn "Fira Code 9" --nb "#201C1C" --nf "#dfdfdf" --tb "#444444" --tf "#dfdfdf" --ff "#ffcd1a" --hb "#242c34" --hf "#8734ff"
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
    grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" $dest
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

function sc-start {
    cat /tmp/sc.pid && notify-send "screencapture" "already recording" && exit
    dest="$HOME/Screencaptures/$(date '+%F-%T-%a').mkv"
    notify-send "screencapture" "screen capturing started"
    wf-recorder -g "$(slurp)" -f $dest &
    echo $! > /tmp/sc.pid
    wl-copy $dest
}

function sc-stop {
    pkill -F /tmp/sc.pid
    rm /tmp/sc.pid
    notify-send "screencapture" "screen capturing stopped"
}

function screencapture {
    choice=$(bemenu_show "sc-start\nsc-stop")
    $choice
}

function music {
    choice=$(bemenu_show "prev\nnext\npause\nplay")
    res=$(mpc $choice)
    echo $res
    notify-send "music" "$res"
}

function movies {
    choice=$(bemenu_show "$(ls ~/Movies | sed 's/.mkv//')")
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
    choice=$(bemenu_show "$(tac /tmp/clipboard)")
    [[ -z $choice ]] && exit 0
    wl-copy $choice
    sed -i '$ d' /tmp/clipboard
}

function power-menu {
    choice=$(bemenu_show "poweroff\nreboot")
    [[ -z $choice ]] && exit 0
    $choice
}

function reminder {
    time=$(bemenu_show "")
    text=$(bemenu_show "")
    (sleep $time && notify-send -t 0 "reminder" "<span foreground='gray'>$(date '+%F-%T-%a')</span>\n$text") &
}

choice=$(bemenu_show "go-pass\nscreenshot\nscreencapture\nclipboard\nreminder\nbrowser\nmusic\nmovies\nmanual\npublic-ip\npower-menu")
[[ -z $choice ]] && exit 0
$choice
