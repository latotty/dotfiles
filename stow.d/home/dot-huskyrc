#!/bin/zsh

# Husky needs an explicit file to load the shell profile
# This is required to use Husky git hooks with UI (Vscode)
# https://github.com/typicode/husky/tree/v5.2.0/docs#command-not-found
# https://typicode.github.io/husky/how-to.html#solution

if [[ -z $HUSKY_ZPROFILE_INIT ]]; then
    export HUSKY_ZPROFILE_INIT=1
    \. "$HOME/.zprofile"
fi
