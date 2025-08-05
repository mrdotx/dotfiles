"""
path:   /home/klassiker/.local/share/repos/dotfiles/.config/ranger/commands.py
author: klassiker [mrdotx]
url:    https://github.com/mrdotx/dotfiles
date:   2025-08-05T05:40:48+0200
"""

# from __future__ import (absolute_import, division, print_function)
import os
import sys
from subprocess import PIPE
from ranger.api.commands import Command

# fzf find files
class fzf_find(Command):
    """
    :fzf_find <optional find options>

    Search(find) for files/folders and use fzf_find.sh to preview/select.
    """
    def execute(self):
        if self.arg(1):
            options = str(self.rest(1))
        else:
            options = ''

        command = "find . " + options + " 2>/dev/null \
                | sed 's/^.\\///' \
                | sort -fV \
                | fzf_find.sh"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# fzf find tagged files
class fzf_tagged(Command):
    """
    :fzf_tagged

    Search for tagged files/folders and use fzf_find.sh to preview/select.
    """
    def execute(self):
        command = "cut -d':' -f2 \"$HOME/.local/share/ranger/tagged\" \
                | sort -fV \
                | fzf_find.sh"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# fzf search file content
class fzf_grep(Command):
    """
    :fzf_grep <query>

    Search(grep) file content, use fzf_find.sh to preview/select file and
    open file with search string in editor.
    """
    def execute(self):
        if self.arg(1):
            search_string = str(self.rest(1))
        else:
            self.fm.notify("Usage: fzf_grep \"<search string>\"", bad=True)
            return

        command = "grep --color=never -Iirsl " + search_string + " \
                | sort -fV \
                | fzf_find.sh"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isfile(fzf_file):
                run_file = "$EDITOR %s -c /%s" % (fzf_file, search_string)
                self.fm.select_file(fzf_file)
                self.fm.run(run_file)

# flat directory view toggle
class flat_toggle(Command):
    """
    :flat_toggle

    Un-/flattens the directory view.
    """
    def execute(self):
        self.fm.thisdir.unload()
        if self.fm.thisdir.flat != 0:
            self.fm.thisdir.flat = 0
        else:
            self.fm.thisdir.flat = -1
        self.fm.thisdir.load_content()
