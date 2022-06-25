#!/bin/bash

function show_menu {
    printf "$@" | ~/dotfiles/scripts/fzfmenu.sh
}

function go-pass {
    gopass -c $(show_menu "$(gopass list --flat | sed 's/\n/\\n/g')")
}

function screenshot {
    function full {
        dest="$HOME/Screenshots/$(date '+%F-%T-%a')_full.png"
        grim $dest
        wl-copy < $dest
        notify-send "grim" "full screenshot saved as $dest"
    }

    function window {
        dest="$HOME/Screenshots/$(date '+%F-%T-%a')_window.png"
        grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" $dest
        wl-copy < $dest
        notify-send "grim" "window screenshot saved as $dest"
    }

    function partial {
        dest="$HOME/Screenshots/$(date '+%F-%T-%a')_partial.png"
        grim -g "$(slurp)" $dest
        wl-copy < $dest
        notify-send "grim" "partial screenshot saved as $dest"
    }

    choice=$(show_menu "full\nwindow\npartial")
    $choice
}

function screencapture {
    function start {
        cat /tmp/sc.pid && notify-send "screencapture" "already recording" && exit
        dest="$HOME/Screencaptures/$(date '+%F-%T-%a').mkv"
        notify-send "screencapture" "screen capturing started"
        wf-recorder -g "$(slurp)" -f $dest &
        echo $! > /tmp/sc.pid
        wl-copy $dest
    }

    function stop {
        pkill -F /tmp/sc.pid
        rm /tmp/sc.pid
        notify-send "screencapture" "screen capturing stopped"
    }

    choice=$(show_menu "start\nstop")
    $choice
}

function power-menu {
    choice=$(show_menu "poweroff\nreboot\nsuspend\nhibernate")
    [[ -z $choice ]] && exit 0
    systemctl $choice
}

choices="go-pass\nscreenshot\nscreencapture\npower-menu"
choice=$(show_menu $choices)
$choice

