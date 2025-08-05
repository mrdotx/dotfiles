#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2025-08-05T05:42:10+0200

output_state=$(xrandr)

connected() {
    printf "%s" "$output_state" | grep -q "$1 connected"
}

# secondary monitor
if connected "HDMI-A-0"; then
    # desktop primary monitor
    connected "DisplayPort-0" \
        && xrandr \
            --output "DisplayPort-0" --primary \
            --output "HDMI-A-0" --above "DisplayPort-0"

    # notebook primary monitor
    connected "eDP" \
        && xrandr \
            --output "HDMI-A-0" --primary \
            --output "eDP" --right-of "HDMI-A-0"
fi
