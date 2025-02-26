#!/bin.zsh

# Use Emacs keybindings
bindkey -e

# ⌥ + Left / Right (Jump by word)
bindkey "^[b" backward-word   # ⌥ + ←
bindkey "^[f" forward-word    # ⌥ + →

# ⌘ + Left / Right (Move to start/end of line)
bindkey "^A" beginning-of-line  # ⌘ + ←
bindkey "^E" end-of-line        # ⌘ + →

# Search history with arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey ' ' magic-space                               # [Space] - don't do history expansion
