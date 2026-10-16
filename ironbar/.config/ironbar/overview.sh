#!/bin/sh
# Show the bar only while niri's overview is open. niri sends the current
# overview state when the stream starts, and again on every change.

niri msg --json event-stream |
    jq --unbuffered -r 'select(.OverviewOpenedOrClosed) | .OverviewOpenedOrClosed.is_open' |
    while read -r open; do
        ironbar bar main set-visible "$open" >/dev/null
    done
