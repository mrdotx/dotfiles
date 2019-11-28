#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/cmus.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-28 13:42:26

if info=$(cmus-remote -Q 2> /dev/null); then

    status=$(echo "$info" | grep '^status ' | sed 's/^status //')
    stream=$(echo "$info" | grep '^stream ' | sed 's/^stream //')
    duration=$(echo "$info" | grep '^duration ' | sed 's/^duration //')
    position=$(echo "$info" | grep '^position ' | sed 's/^position //')
    file=$(echo "$info" | grep '^file ' | sed 's/^file //')
    artist=$(echo "$info" | grep '^tag artist ' | sed 's/^tag artist //')
    album=$(echo "$info" | grep '^tag album ' | sed 's/^tag album //')
    tracknumber=$(echo "$info" | grep '^tag tracknumber ' | sed 's/^tag tracknumber //')
    title=$(echo "$info" | grep '^tag title ' | sed 's/^tag title //')
    genre=$(echo "$info" | grep '^tag genre ' | sed 's/^tag genre //')
    comment=$(echo "$info" | grep '^tag comment ' | sed 's/^tag comment //')

    if [ "$duration" -ge 0 ]; then
        positionminutes=$(printf "%02d" $((position / 60)))
        positionseconds=$(printf "%02d" $((position % 60)))
        durationminutes=$(printf "%02d" $((duration / 60)))
        durationseconds=$(printf "%02d" $((duration % 60)))
        titlestatus="$positionminutes:$positionseconds / $durationminutes:$durationseconds"
    fi

    case $status in
        "playing") info="%{F#dfdfdf}%{o#00b200} $titlestatus" ;;
        "paused") info="%{F#dfdfdf}%{o#b0b200} $titlestatus" ;;
        "stopped") info="%{F#dfdfdf}%{o#ff5555} $titlestatus" ;;
        *) info="" ;;
    esac

    if [[ "$stream" == "" ]]; then
        infobody="$artist - $title"
    else
        infobody="$title - $stream"
    fi

    if [[ "$artist" == "" && "$title" == "" ]]; then
        echo "$info" "${file##*/}%{o-}%{F-}"
    else
        echo "$info" "$infobody%{o-}%{F-}"
    fi

else
    echo ""
fi
