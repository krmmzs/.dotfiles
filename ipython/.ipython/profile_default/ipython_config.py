# vim mode for ipython
c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False

# No need to mess with timeoutlen which in turn breaks normal vim commands.
# see https://github.com/ipython/ipython/issues/13443#issuecomment-1172097730
# c.TerminalInteractiveShell.timeoutlen = 0.25
