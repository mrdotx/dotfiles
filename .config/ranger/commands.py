"""
path:   /home/klassiker/.local/share/repos/dotfiles/.config/ranger/commands.py
author: klassiker [mrdotx]
github: https://github.com/mrdotx/dotfiles
date:   2024-06-07T21:26:58+0200
"""

# from __future__ import (absolute_import, division, print_function)
import os
import sys
from subprocess import PIPE
from ranger.api.commands import Command

# fzf find tagged files
class fzf_tagged(Command):
    """
    :fzf_tagged

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

# fzf find files
class fzf_find(Command):
    """
    :fzf_find <optional find options>

    Search(find) for files/folders and use fzf to preview(highlight)/select.
    """
    def execute(self):
        if self.arg(1):
            options = str(self.rest(1))
        else:
            options = ''

        command = "find . " + options + " 2> /dev/null \
                | sed -e 1d -e 's/^.\\///' \
                | fzf -e \
                    --preview-label='[ " + os.getcwd() + " ]' \
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

# fzf find files with image preview
class fzf_image(Command):
    """
    :fzf_image <optional directory>

    Search for files including image preview with fzf_find.sh and select.
    """
    def execute(self):
        if self.arg(1):
            path = str(self.rest(1)) + '/'
        else:
            path = ''

        command = "fzf_find.sh " + path
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            self.fm.select_file(fzf_file)

# fzf search file content
class fzf_grep(Command):
    """
    :fzf_grep <query>

    Search(grep) file content, use fzf to preview(highlight)/select file and
    open file with search string in editor.
    """
    def execute(self):
        if self.arg(1):
            search_string = str(self.rest(1))
        else:
            self.fm.notify("Usage: fzf_grep \"<search string>\"", bad=True)
            return

        command = "grep --color=never -Iirsl " + search_string + " \
                | fzf -e \
                    --preview-label='[ " + os.getcwd() + " ]' \
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

# flat directory view toggle
class flat_toggle(Command):
    """
    :flat_toggle

    Un-/flattends the directory view.
    """
    def execute(self):
        if self.fm.thisdir.flat != 0:
            self.fm.thisdir.flat = 0
        else:
            self.fm.thisdir.flat = -1
