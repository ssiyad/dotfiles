#!/usr/bin/bash

case "$1" in
  journal)
    nohup alacritty -e nvim -c ":Obsidian today" > /dev/null 2>&1 &
    exit 0
    ;;
  reading_list)
    nohup alacritty -e nvim ~/notes/reading-list.md > /dev/null 2>&1 &
    exit 0
    ;;
  tasks)
    nohup alacritty -e nvim ~/notes/tasks.md > /dev/null 2>&1 &
    exit 0
    ;;
esac

echo -e "tasks\x00display\x1fTasks"
echo -e "journal\x00display\x1fJournal"
echo -e "reading_list\x00display\x1fReading List"
