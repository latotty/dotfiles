# https://github.com/marlonrichert/zsh-snap

# Download Znap, if it's not there yet.
[[ -r ~/.zshstuff/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zshstuff/znap

source ~/.zshstuff/znap/znap.zsh  # Start Znap

# Prompt - https://starship.rs/
znap eval starship 'starship init zsh --print-full-init'
znap prompt

# OhMyZSH - https://github.com/ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh plugins/{git,mise,docker,brew}

# Plugins
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-completions
znap source marlonrichert/zsh-edit
znap source ael-code/zsh-colored-man-pages

# Completion
## TODO - Check if tools are installed
znap fpath _kubectl 'kubectl completion  zsh'
znap fpath _rustup  'rustup  completions zsh'
znap fpath _cargo   'rustup  completions zsh cargo'
znap fpath _bun     'bun     completions zsh'
znap fpath _pnpm    'pnpm    completion zsh'

autoload -Uz compinit
compinit
