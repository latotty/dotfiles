#!/bin/zsh
if command -v mise >/dev/null 2>&1; then
    # Use shim binaries
    eval "$(mise activate zsh --shims)"
fi
