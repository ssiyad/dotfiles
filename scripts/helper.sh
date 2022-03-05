#!/bin/bash

TERM=kitty

function bemenu_show_raw {
    printf "$@" | bemenu -i -p "" -l 20 --fn "JetBrainsMono Nerd Font 9" --nb "#1a1b26f2" --nf "#dfdfdf" --tb "#afff00" --tf "#1a1b26f2" --ff "#afff00" --fb "1a1b26f2" --hf "#1a1b26f2" --hb "#afff00"
}

function bemenu_show {
    bemenu_show_raw "$@" | sed -r 's/ /-/g'
}

function go-pass {
    gopass -c $(bemenu_show "$(gopass list --flat)")
}

function screenshot {
    function full {
        dest="$HOME/Screenshots/$(date '+%F-%T-%a')_full.png"
        grim $dest
        wl-copy $dest
        notify-send "grim" "full screenshot saved as $dest"
    }

    function window {
        dest="$HOME/Screenshots/$(date '+%F-%T-%a')_window.png"
        grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" $dest
        wl-copy $dest
        notify-send "grim" "window screenshot saved as $dest"
    }
    function partial {
        dest="$HOME/Screenshots/$(date '+%F-%T-%a')_partial.png"
        grim -g "$(slurp)" $dest
        wl-copy $dest
        notify-send "grim" "partial screenshot saved as $dest"
    }

    choice=$(bemenu_show "full\nwindow\npartial")
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

    choice=$(bemenu_show "start\nstop")
    $choice
}

function clipboard {
    choice=$(bemenu_show_raw "$(grep -m 1 -H '.' /tmp/clipboard/* | tac | sed -r 's/\/tmp\/clipboard\///g' | sed -r 's/:/ /')")
    read -ra array <<< $choice
    [[ -z $choice ]] && exit 0
    wl-copy < /tmp/clipboard/${array[0]}
    rm /tmp/clipboard/${array[0]}
}

function power-menu {
    choice=$(bemenu_show "poweroff\nreboot\nsuspend")
    [[ -z $choice ]] && exit 0
    systemctl $choice
}

choice=$(bemenu_show "go-pass\nscreenshot\nscreencapture\nclipboard\npower-menu")
[[ -z $choice ]] && exit 0
$choice
