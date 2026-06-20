#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/templates/sh.tpl
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/<++>
# date:   2026-06-20T04:58:48+0200

script=$(basename "$0")
help="$script [-h/--help] -- script to <++>
  Usage:
    $script [<++>]

  Setting:
    [<++>] = name of the bla to be blub

  Example:
    $script <++>"

case "$1" in
    -h | --help)
        printf "%s\n" "$help"
        return
        ;;
esac

<++>
