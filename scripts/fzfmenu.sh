#!/bin/bash
# fzfmenu - fzf as dmenu replacement

input=$(mktemp -u --suffix .fzfmenu.input)
output=$(mktemp -u --suffix .fzfmenu.output)
mkfifo $input
mkfifo $output
chmod 600 $input $output

# the ugly printf | sed thing is here to make args with quotes work.
# (e.g. --preview='echo {1}')
# sadly we can't use "$@" here directly because we are inside sh -c "..." call
# already

alacritty \
    --title fzfmenu \
    --class term_float \
    --option 'window.dimensions.columns=100' \
    --option 'window.dimensions.lines=13' \
    --command \
        bash -c "cat $input | fzf $(printf -- " '%s'" "$@" | sed "s/^ ''$//") | tee $output" & disown

# handle ctrl+c outside child terminal window
trap "kill $! 2>/dev/null; rm -f $input $output" EXIT

cat > $input
cat $output
