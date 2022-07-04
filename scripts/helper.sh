#!/bin/bash

function show_menu {
    echo -e "$@" | ~/dotfiles/scripts/fzfmenu.sh | sed -e 's/\(.*\)/\L\1/' | sed -e 's/ /-/g'
}

function network {
    net=$(show_menu "$(nmcli connection show | tail -n +2)" | cut -d "-" -f 1)
    res=$(nmcli connection up $net)
    notify-send "network" "$res"
}

function bluetooth {
    function connect {
        choice=$(show_menu "$(bluetoothctl devices)" | cut -d "-" -f 2)
        res=$(bluetoothctl connect $choice) 
        notify-send "bluetooth" "$res"
    }

    function scan {
        choice=$(show_menu "On\nOff")
        res=$(bluetoothctl scan $choice) 
        notify-send "bluetooth" "$res" 
    }

    function power {
        choice=$(show_menu "On\nOff")
        res=$(bluetoothctl power $choice)
        notify-send "bluetooth" "$res" 
    }

    choice=$(show_menu "Connect\nScan\nPower")
    $choice
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

    choice=$(show_menu "Full\nWindow\nPartial")
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

    choice=$(show_menu "Start\nStop")
    $choice
}

function power-menu {
    choice=$(show_menu "Poweroff\nReboot\nSuspend\nHibernate")
    [[ -z $choice ]] && exit 0
    systemctl $choice
}

choices="Network\nBluetooth\nGo Pass\nScreenshot\nScreencapture\nPower Menu"
choice=$(show_menu $choices)
$choice

