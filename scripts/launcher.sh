#!/bin/bash

alacritty \
    --title Applications \
    --class term_float \
    --option 'window.dimensions.columns=100' \
    --option 'window.dimensions.lines=13' \
    --command  \
        j4-dmenu-desktop \
            --term alacritty \
            --use-xdg-de \
            --no-generic \
            --display-binary \
            --dmenu 'fzf' \
            --wrapper 'sway exec' \

