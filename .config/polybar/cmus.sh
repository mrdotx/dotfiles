#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/cmus.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-28 14:04:57

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
        position_minutes=$(printf "%02d" $((position / 60)))
        position_seconds=$(printf "%02d" $((position % 60)))
        duration_minutes=$(printf "%02d" $((duration / 60)))
        duration_seconds=$(printf "%02d" $((duration % 60)))
        title_status="$position_minutes:$position_seconds / $duration_minutes:$duration_seconds"
    fi

    case $status in
        "playing") info="%{F#dfdfdf}%{o#00b200} $title_status" ;;
        "paused") info="%{F#dfdfdf}%{o#b0b200} $title_status" ;;
        "stopped") info="%{F#dfdfdf}%{o#ff5555} $title_status" ;;
        *) info="" ;;
    esac

    if [[ "$stream" == "" ]]; then
        info_body="$artist - $title"
    else
        info_body="$title - $stream"
    fi

    if [[ "$artist" == "" && "$title" == "" ]]; then
        echo "$info ${file##*/}%{o-}%{F-}"
    else
        echo "$info $info_body%{o-}%{F-}"
    fi

else
    echo ""
fi
