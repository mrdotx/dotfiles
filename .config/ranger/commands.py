"""
path:   /home/klassiker/.local/share/repos/dotfiles/.config/ranger/commands.py
author: klassiker [mrdotx]
github: https://github.com/mrdotx/dotfiles
date:   2021-07-22T14:53:01+0200
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

    Search(find) for files/folder and use fzf to preview(highlight)/select.
    """
    def execute(self):
        command="find -L . \\( -path '*/\\.*' \
                        -o -fstype 'dev' \
                        -o -fstype 'proc' \\) \
                    -prune -o -print 2> /dev/null \
                | sed 1d \
                | cut -b3- \
                | fzf -e -i --preview 'highlight {1}' \
                    --preview-window 'right:70%'"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# fuzzy locate files
class FzfLocate(Command):
    """
    :FzfLocate

    Search(locate) for files/folder and use fzf to preview(highlight)/select.
    """
    def execute(self):
        command="fzf_path=\"$(pwd)\"; \
                locate $fzf_path \
                | sed \"1d;s#$fzf_path/##g\" \
                | fzf -e -i --preview 'highlight {1}' \
                    --preview-window 'right:70%'"
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

    Search(grep) file content and use fzf to preview(highlight)/select.
    """
    def execute(self):
        command="grep --color=never -irs -- " + str(self.rest(1)) + " \
                | cut -d ':' -f1 \
                | uniq \
                | fzf -e -i --preview 'highlight {1}' \
                    --preview-window 'right:70%'"
        fzf = self.fm.execute_command(command, stdout=PIPE)
        stdout, sys.stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
