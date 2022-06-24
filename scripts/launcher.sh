#!/bin/bash

alacritty \
    --title Applications \
    --class term_float \
    --command  \
        j4-dmenu-desktop \
            --term alacritty \
            --use-xdg-de \
            --no-generic \
            --display-binary \
            --dmenu 'fzf --reverse' \
            --wrapper 'sway exec' \

