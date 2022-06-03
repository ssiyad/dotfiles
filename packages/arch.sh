#!/bin/bash

for group in `cat groups.list`; do
    echo '' > /tmp/pacman_groups_members
    pacman -Sqg $group >> /tmp/pacman_groups_members
done

pacman -Qqen > pacman.list 
echo "$(comm -23 pacman.list /tmp/pacman_groups_members)" > pacman.list
sed -i -e 's/\s\+/\n/g' pacman.list
rm /tmp/pacman_groups_members

pacman -Qqem > aur.list 

