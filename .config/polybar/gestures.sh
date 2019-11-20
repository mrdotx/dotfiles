#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/gestures.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-20 12:10:36

case "$1" in
    --polybar)
        if [ "$(pgrep -f /usr/bin/libinput-gestures)" ]
        then
        	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
        else
        	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
        fi
        ;;
    *)
        if [ "$(pgrep -f /usr/bin/libinput-gestures)" ]
        then
                libinput-gestures-setup stop && \
                    notify-send -i "$HOME/.config/polybar/icons/gestures.png" "LibInput" "LibInput Gestures stopped!" && \
                    exit 0
        else
                libinput-gestures-setup start >/dev/null 2>&1 && \
                    notify-send -i "$HOME/.config/polybar/icons/gestures.png" "LibInput" "LibInput Gestures started!" && \
                    exit 0
        fi
        ;;
esac
