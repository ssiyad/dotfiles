#!/usr/bin/bash

case "$1" in
  suspend)
    notify-send "Suspending system..."
    ( sleep 3 && systemctl suspend ) &
    exit 0
    ;;
  hibernate)
    notify-send "Hibernating system..."
    ( sleep 3 && systemctl hibernate ) &
    exit 0
    ;;
  shutdown)
    notify-send "Shutting down system..."
    ( sleep 3 && systemctl poweroff ) &
    exit 0
    ;;
esac

# Only output menu if no argument is given
if [ -z "$1" ]; then
  echo -e "suspend\x00display\x1fSuspend"
  echo -e "hibernate\x00display\x1fHibernate"
  echo -e "shutdown\x00display\x1fShutdown"
fi
