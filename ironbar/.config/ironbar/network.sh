#!/bin/sh
# Show the default-route connection: SSID and signal for Wi-Fi, the address
# for wired. With "icon", print a matching icon name instead.
# Ironbar's network_manager module needs NetworkManager; this machine uses iwd.

iface=$(ip route show default | awk '{ for (i = 1; i < NF; i++) if ($i == "dev") { print $(i + 1); exit } }')

if [ -z "$iface" ]; then
    [ "$1" = icon ] && echo network-wireless-offline-symbolic || echo Offline
    exit 0
fi

if [ ! -d "/sys/class/net/$iface/wireless" ]; then
    [ "$1" = icon ] && echo network-wired-symbolic && exit 0
    ip -4 -o addr show dev "$iface" | awk '{ split($4, addr, "/"); print addr[1]; exit }'
    exit 0
fi

# Same scale as Waybar: 100% at -45 dBm, falling off to 0% at -90 dBm
# and for signals that are too strong.
iw dev "$iface" link | awk -v mode="$1" '
    /^[[:space:]]*SSID:/ { sub(/^[[:space:]]*SSID: /, ""); ssid = $0 }
    /^[[:space:]]*signal:/ { dbm = $2 }
    END {
        diff = dbm + 45
        if (diff < 0) diff = -diff
        strength = int(100 - diff / 45 * 100)
        if (strength < 0) strength = 0

        if (mode != "icon") {
            printf "%s %d%%\n", ssid, strength
        } else if (strength >= 80) {
            print "network-wireless-signal-excellent-symbolic"
        } else if (strength >= 55) {
            print "network-wireless-signal-good-symbolic"
        } else if (strength >= 30) {
            print "network-wireless-signal-ok-symbolic"
        } else if (strength >= 5) {
            print "network-wireless-signal-weak-symbolic"
        } else {
            print "network-wireless-signal-none-symbolic"
        }
    }
'
