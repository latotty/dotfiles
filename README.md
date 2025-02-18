# dotfiles

## For everyone

Install brew [https://brew.sh/]

### For Zsh Stuff

```sh
brew install starship git
brew install --cask font-fira-code
```

Use a [Nerd font](https://www.nerdfonts.com/) in your terminal

For example add this to you vscode config:
```json
  "editor.fontFamily": "FiraCode Nerd Font",
  "editor.fontLigatures": true,
```

Copy the content of zsh folder to ~

Tweak what you want

## For Totty

```
brew bundle --file ./brew/.Brewfile
stow */
```

On brew change: `brew bundle dump --global --force`

