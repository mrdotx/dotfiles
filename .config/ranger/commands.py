"""
path:   /home/klassiker/.local/share/repos/dotfiles/.config/ranger/commands.py
author: klassiker [mrdotx]
github: https://github.com/mrdotx/dotfiles
date:   2023-05-27T07:04:53+0200
"""

from __future__ import (absolute_import, division, print_function)
import os
import sys
from subprocess import PIPE
from ranger.api.commands import Command

# fuzzy find files
class FzfFind(Command):
    """
    :FzfFind

    Search(find) for files/folders and use fzf to preview(highlight)/select.
    """
    def execute(self):
        command = "find . -name '*' 2> /dev/null \
                | sed 1d \
                | cut -b3- \
                | fzf -e \
                    --preview-window 'up:75%:wrap' \
                    --preview 'highlight {}'"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# fuzzy tagged files
class FzfTagged(Command):
    """
    :FzfTagged

    Use fzf to preview(highlight)/select tagged files/folders and jump to them.
    """
    def execute(self):
        command = "sort \"$HOME/.local/share/ranger/tagged\" \
                | cut -d':' -f2 \
                | fzf -e \
                    --preview-window 'up:75%:wrap' \
                    --preview 'highlight {}'"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# fuzzy search file content
class FzfGrep(Command):
    """
    :FzfGrep <query>

    Search(grep) file content, use fzf to preview(highlight)/select file and
    open file with search string in editor.
    """
    def execute(self):
        if self.arg(1):
            search_string = str(self.rest(1))
        else:
            self.fm.notify("Usage: fzfgrep \"<search string>\"", bad=True)
            return

        command = "grep --color=never -Iirsl " + search_string + " \
                | fzf -e \
                    --preview-window 'up:75%:wrap' \
                    --preview 'highlight {}'"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isfile(fzf_file):
                run_file = "$EDITOR %s -c /%s" % (fzf_file, search_string)
                self.fm.select_file(fzf_file)
                self.fm.run(run_file)
