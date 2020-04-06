#!/bin/sh
grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" "$HOME/Screenshots/$(date '+%F-%T-%a')_window_.png"
