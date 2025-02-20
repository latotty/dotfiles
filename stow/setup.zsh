#!/usr/bin/env zsh

local REMOVE=false
local SIMULATE=false

local help_text="Usage: setup.zsh [-D] [-n] [-h]
  -D  Remove links
  -n  Simulate operations
  -h  Show this help"

while getopts "Dnh" opt; do
    case $opt in
        D)
            REMOVE=true
        ;;
        n)
            SIMULATE=true
        ;;
        h)
            echo "$help_text" >&2
            exit 0
        ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "$help_text" >&2
            exit 1
        ;;
  esac
done

local STOW_ARGS=("--dotfiles" "--target" "$HOME")
if $REMOVE; then
    STOW_ARGS+=("--delete")
else
    STOW_ARGS+=("--stow")
fi
if $SIMULATE; then
    STOW_ARGS+=("-n" "-vvv")
else
    STOW_ARGS+=("-v")
fi
STOW_ARGS+=(".")

local PARENT_FOLDER=$(dirname $(dirname $0))

find $PARENT_FOLDER -mindepth 2 -maxdepth 2 -type d -name "stow.d" -exec stow --dir={} $STOW_ARGS \;
