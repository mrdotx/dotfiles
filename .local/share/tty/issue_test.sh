#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.local/share/tty/issue_test.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2024-04-04T07:30:18+0200

issue_path="$HOME/.local/share/repos/dotfiles/.local/share/tty/issue"

issue=$(sed \
    -e 's/m \\l/m tty1/g' \
    -e 's/m\\s \\m/mLinux x86_64/g' \
    -e 's/m\\r/m2.4.37-arch1-1/g' \
    -e 's/m\\d/mFri Nov 11 2011/g' \
    -e 's/m\\t/m11:11:11/g' \
    -e 's/m\\n/mhostname/g' \
    -e 's/m\\b/m38400/g' \
    -e 's/m\\U/m1 user/g' \
    -e 's/e\[/033\[/g' \
    "$issue_path" \
)

printf "%b" "$issue"
