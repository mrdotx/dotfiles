#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.conky/conky.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-03 17:49:01

# variables {{{
SERVICE=conky
CONKY1=$HOME/.conky/arc-dark-horizontal.conf
CONKY2=$HOME/.conky/arc-dark-slim-horizontal.conf
CONKY3=$HOME/.conky/arc-dark-vertical.conf
CONKY4=$HOME/.conky/shortcuts_foreground_left.conf
CONKY5=$HOME/.conky/shortcuts_foreground_middle.conf
CONKY6=$HOME/.conky/shortcuts_foreground_right.conf
CONKY7=$HOME/.conky/shortcuts_background_left.conf
CONKY8=$HOME/.conky/shortcuts_background_middle.conf
CONKY9=$HOME/.conky/shortcuts_background_right.conf
# }}}

CHOICE=$1

# if no config given use vertical
[ -z "$1" ] && {
CHOICE=vertical
}

case "$CHOICE" in

# small {{{
small)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY2")" ]; then
        # slim horizontal -> horizontal"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY2") && $SERVICE -q -c "$CONKY1" &
        exit 0
    elif [ "$(pgrep -f "$SERVICE -c $CONKY1")" ]; then
        # horizontal -> slim horizontal"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY1") && $SERVICE -q -c "$CONKY2" &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY1" &
        exit 0
    fi
    ;;
# }}}

# large {{{
large)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY3")" ]; then
        # vertical -> stop"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY3") && exit 0
    elif [ "$(pgrep -f "$SERVICE -q -c $CONKY2")" ]; then
        # slim horizontal -> vertical"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY2") && $SERVICE -q -c "$CONKY3" &
        exit 0
    elif [ "$(pgrep -f "$SERVICE -q -c $CONKY1")" ]; then
        # horizontal -> slim horizontal"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY1") && $SERVICE -q -c "$CONKY2" &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY1" &
        exit 0
    fi
    ;;
# }}}

# horizontal {{{
horizontal)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY1")" ]; then
        # stop"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY1") &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY1" &
        exit 0
    fi
    ;;
# }}}

# slim-horizontal {{{
slim-horizontal)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY2")" ]; then
        # stop"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY2") &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY2" &
        exit 0
    fi
    ;;
# }}}

# vertical {{{
vertical)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY3")" ]; then
        # stop"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY3") &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY3" &
        exit 0
    fi
    ;;
# }}}

# shortcuts foreground{{{
shortcutsforeground)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY6")" ]; then
        # stop"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY4") &
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY5") &
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY6") &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY4" &
        $SERVICE -q -c "$CONKY5" &
        $SERVICE -q -c "$CONKY6" &
        exit 0
    fi
    ;;
# }}}

# shortcuts background{{{
shortcutsbackground)
    if [ "$(pgrep -f "$SERVICE -q -c $CONKY9")" ]; then
        # stop"
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY7") &
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY8") &
        kill -SIGTERM $(pgrep -f "$SERVICE -q -c $CONKY9") &
        exit 0
    else
        # start"
        $SERVICE -q -c "$CONKY7" &
        $SERVICE -q -c "$CONKY8" &
        $SERVICE -q -c "$CONKY9" &
        exit 0
    fi
    ;;
# }}}

esac
