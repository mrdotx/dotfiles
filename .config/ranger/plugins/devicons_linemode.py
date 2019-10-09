# vim:fileencoding=utf-8:ft=python:foldmethod=marker

# Path:     ~/.config/ranger/plugins/devicons_linemode.py
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

import os
terminal=terminal=os.getenv('TERM')
if terminal != 'linux':
  import ranger.api
  from ranger.core.linemode import LinemodeBase
  from devicons import *

  @ranger.api.register_linemode
  class DevIconsLinemode(LinemodeBase):
    name = "devicons"

    uses_metadata = False

    def filetitle(self, file, metadata):
      return devicon(file) + ' ' + file.relative_path

  @ranger.api.register_linemode
  class DevIconsLinemodeFile(LinemodeBase):
    name = "filename"

    def filetitle(self, file, metadata):
      return devicon(file) + ' ' + file.relative_path
