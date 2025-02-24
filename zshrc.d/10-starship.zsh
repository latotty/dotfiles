#!/bin/zsh
if command -v starship >/dev/null 2>&1; then
    # Prompt - https://starship.rs/
    eval "$(starship init zsh)"
    znap prompt
fi