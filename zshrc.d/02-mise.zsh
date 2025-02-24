#!/bin/zsh
MISE_UPDATE_FILE="${ZSHSTUFF}/.mise_last_update"

if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"

    if [[ ! -f $MISE_UPDATE_FILE ]] || [[ $(find $MISE_UPDATE_FILE -mtime +7) ]]; then
        echo -ne "Checking for Mise updates..."
        mise update >/dev/null 2>&1
        OUTDATED=$(mise outdated >/dev/null 2>&1)
        if [[ -n "$OUTDATED" ]]; then
            echo -ne "\r⛔️ Mise is outdated.        \n"
        else
            echo -ne "\r✅ Mise is up to date.      \n"
            touch $MISE_UPDATE_FILE
        fi
    fi

    # Alias to execute tools through mise. Eg.:
    #     mise use node@20
    #     mise x -- node -v
    alias mx="mise x --"
fi