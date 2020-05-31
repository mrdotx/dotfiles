#!/bin/sh

# path:       /home/klassiker/.config/nvim/templates/skeleton.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/<++>
# date:       2020-05-31T18:48:00+0200

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
