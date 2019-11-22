#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/cmus.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-22 01:03:10

if info=$(cmus-remote -Q 2> /dev/null); then
    status=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "status " | cut -d ' ' -f 2)

    if [ "$status" = "playing" ] || [ "$status" = "paused" ] || [ "$status" = "stopped" ]; then
        title=$(echo "$info" | grep -v 'set ' | grep " title " | cut -d ' ' -f 3-)
        artist=$(echo "$info" | grep -v 'set ' | grep " artist " | cut -d ' ' -f 3-)
        position=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "position " | cut -d ' ' -f 2)
        duration=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "duration " | cut -d ' ' -f 2)

        if [ "$duration" -ge 0 ]; then
            pos_minutes=$(printf "%02d" $((position / 60)))
            pos_seconds=$(printf "%02d" $((position % 60)))

            dur_minutes=$(printf "%02d" $((duration / 60)))
            dur_seconds=$(printf "%02d" $((duration % 60)))

            info_string="| $pos_minutes:$pos_seconds / $dur_minutes:$dur_seconds"
        fi

        info_string="$artist - $title $info_string"

        if [ "$status" = "playing" ]; then
            echo "%{F#dfdfdf}%{o#00b200} $info_string%{o-}%{F-}"
        elif [ "$status" = "paused" ]; then
            echo "%{F#dfdfdf}%{o#b0b200} $info_string%{o-}%{F-}"
        elif [ "$status" = "stopped" ]; then
            echo "%{F#dfdfdf}%{o#ff5555} $info_string%{o-}%{F-}"
        else
            echo ""
        fi
    else
        echo ""
    fi
else
    echo ""
fi
