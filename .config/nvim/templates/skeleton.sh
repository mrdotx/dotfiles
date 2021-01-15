#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/templates/skeleton.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/<++>
# date:   2021-01-15T12:49:03+0100

script=$(basename "$0")
help="$script [-h/--help] -- script to <++>
  Usage:
    $script [<++>]

  Setting:
    [<++>] = name of the bla to be blub

  Example:
    $script <++>"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    printf "%s\n" "$help"
    exit 0
fi

<++>
