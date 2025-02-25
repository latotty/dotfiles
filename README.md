# dotfiles

# Toolset

| Tool         | Description                                                                                        |
| ------------ | -------------------------------------------------------------------------------------------------- |
| [Homebrew][] | Manages applications, system-wide binaries, and vscode plugins. (Including [Mise][] and [Stow][]). |
| [Mise][]     | Manages tools that are usually project specific (eg. nodejs version).                              |
| [Stow][]     | Symlinks the dotfiles, so it's easy to setup and maintain this repository.                         |

# Configuration

If you want to use this repository as the template of your own environment, you
should create a [fork](https://github.com/latotty/dotfiles/fork) and update
the configuration as you wish (starting with the files in the table below). This
way you will be able to pull my latest updates while maintaining your own,
personalised version of the configuration.

| File                                       | Description                                               |
| ------------------------------------------ | --------------------------------------------------------- |
| [Brewfile](./stow.d/home/dot-Brewfile)                     | Contains apps, packages and vs code extensions.           |
| [Gitconfig](./stow.d/home/dot-gitconfig)                   | Contains git configuration. Change at least the username. |
| [Mise](./stow.d/home/dot-config/mise/config.toml)          | Contains the tools that I regularly use.                  |

For local settings create a `~/.zshrc.local` and `~/.zprofile.local`, these will be loaded after each corresponding file.

For project specific config, create a `mise.local.toml` in the project folder (gitignored by default if you linked the global gitignore), and add the required vars into that. [https://mise.jdx.dev/environments/](https://mise.jdx.dev/environments/)

# Setup

After running the commands below, your whole environment will be set up and
ready for work.

```shell
# Install Homebrew and the packages managed by it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ./stow.d/home/dot-Brewfile

# Symlink the configuration files
./scripts/stow-setup.zsh

# Install the packages managed by `mise`
mise install
```


On brew change: `brew bundle dump --global --force`

# Mention

Visit [https://github.com/balintant/dotfiles](https://github.com/balintant/dotfiles), we worked together to update our outdated zsh config 😅



[Homebrew]: https://brew.sh
[Mise]: https://mise.jdx.dev
[Stow]: https://www.gnu.org/software/stow/