#!/bin/bash

TERM=kitty

function bemenu_show_raw {
    printf "$@" | bemenu -i -l 13 --fn "Fira Code 9" --nb "#201C1C" --nf "#dfdfdf" --tb "#444444" --tf "#dfdfdf" --ff "#ffcd1a" --hb "#242c34" --hf "#8734ff"
}

function bemenu_show {
    bemenu_show_raw "$@" | sed -r 's/ /-/g'
}

function go-pass {
    wl-copy $(gopass show -o $(bemenu_show "$(gopass list --flat)"))
    notify-send "gopass" "password copied to clipboard"
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
    choice=$(bemenu_show_raw "$(grep -m 1 -H '.' /tmp/clipboard/* | tac | sed -r 's/\/tmp\/clipboard\///g' | sed -r 's/:/ /')")
    read -ra array <<< $choice
    [[ -z $choice ]] && exit 0
    wl-copy < /tmp/clipboard/${array[0]}
}

function power-menu {
    choice=$(bemenu_show "poweroff\nreboot")
    [[ -z $choice ]] && exit 0
    $choice
}

function tasks {
    function add-task {
        choice=$(bemenu_show_raw "")
        [[ -z $choice ]] && exit 0
        echo $choice >> ~/.tasks
        notify-send "tasks" "new task added: $choice"
    }

    function mark-current-as-done {
        sed -i '1d' ~/.tasks
        notify-send "tasks" "marked current task as done"
    }

    choice=$(bemenu_show "add task\nmark current as done")
    [[ -z $choice ]] && exit 0
    $choice
}

choice=$(bemenu_show "go-pass\nscreenshot\nscreencapture\nclipboard\ntasks\nbrowser\nmusic\nmovies\nmanual\npublic-ip\npower-menu")
[[ -z $choice ]] && exit 0
$choice
