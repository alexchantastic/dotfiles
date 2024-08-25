# dotfiles

My personal collection of dotfiles.

## Requirements

- [zsh](http://www.zsh.org/) - Unix shell
- [Antidote](https://github.com/mattmc3/antidote) - zsh plugin manager
- [tpm](https://github.com/tmux-plugins/tpm) - Tmux plugin manager

## Installation

1. Clone the repo into your home folder

```sh
git clone git@github.com:alexchantastic/dotfiles.git .dotfiles
```

2. Point to the relevant dotfiles

### .zshrc

```sh
source ~/.dotfiles/.zshrc
```

### .gitconfig

```
[include]
    path= ~/.dotfiles/.gitconfig

[user]
    name = YOUR_NAME
    email = YOUR_EMAIL
```

### .config/nvim/init.lua

```lua
package.path = package.path .. ";/path/to/.dotfiles/nvim/?.lua"
require("config")
```

### .tmux.conf

```sh
source ~/.dotfiles/.tmux.conf
```

## Useful things to install

- [bat](https://github.com/sharkdp/bat) - Colorized `cat`
- [btop](https://github.com/aristocratos/btop) - System resource monitor
- [Clipboard](https://github.com/Slackadays/Clipboard) - Clipboard manager
- [croc](https://github.com/schollz/croc) - Send files between computers
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Colorized difftool
- [fd](https://github.com/sharkdp/fd) - Fast find
- [fnm](https://github.com/Schniz/fnm) - Node version manager
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [Git Extras](https://github.com/tj/git-extras) - Git extensions
- [Git](https://git-scm.com/) - Version control
- [Homebrew](https://brew.sh/) - Package manager
- [httpie](https://github.com/httpie/httpie) - HTTP client
- [lazydocker](https://github.com/jesseduffield/lazydocker) - Terminal UI for Docker
- [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for Git
- [Neovim](https://neovim.io/) - Modern vim
- [nnn](https://github.com/jarun/nnn) - File manager
- [Node.js](https://nodejs.org/) - JavaScript runtime
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Fast `grep`
- [sd](https://github.com/chmln/sd) - Improved `sed`
- [tldr](https://github.com/tldr-pages/tldr) - Simplified man pages
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [viu](https://github.com/atanunq/viu) - Image viewer
- [Zoxide](https://github.com/ajeetdsouza/zoxide) - Improved `cd`
