#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/templates/sh.tpl
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/<++>
# date:   2025-08-05T05:32:06+0200

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
