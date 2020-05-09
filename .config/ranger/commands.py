"""
path:       /home/klassiker/.config/ranger/commands.py
author:     klassiker [mrdotx]
github:     https://github.com/mrdotx/dotfiles
date:       2020-05-09T11:31:28+0200
"""

from __future__ import (absolute_import, division, print_function)
import os
from ranger.api.commands import Command

# fuzzy select files (key bind required)
class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' \
                            -o -fstype 'dev' \
                            -o -fstype 'proc' \) \
                        -prune -o -type d -print 2> /dev/null \
                    | sed 1d \
                    | cut -b3- \
                    | fzf -e -i --preview '< {1}'"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' \
                            -o -fstype 'dev' \
                            -o -fstype 'proc' \) \
                        -prune -o -print 2> /dev/null \
                    | sed 1d \
                    | cut -b3- \
                    | fzf -e -i --preview '< {1}'"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# fuzzy locate files (key bind required)
class fzf_locate(Command):
    """
    :fzf_locate

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            command="locate / \
                    | fzf -e -i --preview '< {1}'"
        else:
            command="locate / \
                    | fzf -e -i --preview '< {1}'"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
