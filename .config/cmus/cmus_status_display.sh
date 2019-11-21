#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/cmus/cmus_status_display.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-21 21:58:40

if ps -C cmus > /dev/null; then

    file=`cmus-remote -Q  |
        grep --text '^file' |
        sed -e 's/^file //' |
        awk '{gsub("file ", "");print}'`
    artist=`cmus-remote -Q |
        grep --text '^tag artist' |
        sed '/^tag artistsort/d' |
        awk '{gsub("tag artist ", "");print}'`
    title=`cmus-remote -Q  |
        grep --text '^tag title' |
        sed -e 's/tag title //' |
        awk '{gsub("tag title ", "");print}'`

    if [[ "$artist" == "" && "$title" == "" ]]; then
        notify-send -i "$HOME/.config/cmus/icons/cmus.png" "C* Music Player - Now Playing" "${file##*/}"
    else
        notify-send -i "$HOME/.config/cmus/icons/cmus.png" "C* Music Player - Now Playing" "$artist - $title"
    fi

else
        notify-send -i "$HOME/.config/cmus/icons/cmus.png" "C* Music Player" "Not running!"
fi
