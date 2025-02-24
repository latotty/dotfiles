#!/bin/zsh

znap source ael-code/zsh-colored-man-pages
znap source zsh-users/zsh-autosuggestions

# Must be loaded before zsh-history-substring-search
znap source zsh-users/zsh-syntax-highlighting

export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE="1"
export HISTORY_SUBSTRING_SEARCH_FUZZY="1"
znap source zsh-users/zsh-history-substring-search
