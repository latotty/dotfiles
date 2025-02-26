#!/bin/zsh
export HOMEBREW_NO_ENV_HINTS="please"

if command -v /opt/homebrew/bin/brew >/dev/null 2>&1; then
    eval $(/opt/homebrew/bin/brew shellenv)
    export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

if command -v /usr/local/homebrew/bin/brew >/dev/null 2>&1; then
    alias brew86="arch -x86_64 /usr/local/homebrew/bin/brew"
fi
