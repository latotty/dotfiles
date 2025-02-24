#!/bin/zsh

if command -v kubectl >/dev/null 2>&1; then
    znap fpath _kubectl  'kubectl completion  zsh'
fi

if command -v pnpm >/dev/null 2>&1; then
    znap fpath _pnpm     'pnpm completion zsh'
fi

if command -v rustup >/dev/null 2>&1; then
    znap fpath _rustup  'rustup completions zsh'
    znap fpath _cargo   'rustup completions zsh cargo'
fi

if command -v bun >/dev/null 2>&1; then
    znap fpath _bun     'bun completions zsh'
fi

if command -v docker >/dev/null 2>&1; then
    znap fpath _docker  'docker completion zsh'
fi

autoload -Uz compinit
autoload -U add-zsh-hook

if [[ -z "$ZSH_COMPDUMP" ]]; then
  ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
fi

if [[ ! -f "$ZSH_COMPDUMP.zwc" || "$ZSH_COMPDUMP" -nt "$ZSH_COMPDUMP.zwc" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

znap source zsh-users/zsh-completions