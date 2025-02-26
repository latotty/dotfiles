#!/bin/zsh

# Download Znap, if it's not there yet.
# https://github.com/marlonrichert/zsh-snap
[[ -r ~/.zshstuff/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zshstuff/znap
source ~/.zshstuff/znap/znap.zsh

# Auto-Update znap plugins
ZNAP_UPDATE_FILE="${ZSHSTUFF}/.znap_last_update"
if [[ ! -f $ZNAP_UPDATE_FILE ]] || [[ $(find $ZNAP_UPDATE_FILE -mtime +7) ]]; then
    znap pull && touch $ZNAP_UPDATE_FILE
fi
