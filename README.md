# dotfiles

## For Totty

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ./brew/.Brewfile

./stow/setup.zsh

mise install
```

On brew change: `brew-dump` or `brew bundle dump --global --force`

