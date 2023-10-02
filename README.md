# dotfiles

My personal collection of dotfiles.

## Requirements

* [zsh](http://www.zsh.org/) - Unix shell
* [Antigen](https://github.com/zsh-users/antigen) - zsh plugin manager
* [Vundle](https://github.com/VundleVim/Vundle.vim) - Vim plugin manager
* [tpm](https://github.com/tmux-plugins/tpm) - Tmux plugin manager

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

### .vimrc

```sh
source ~/.dotfiles/.vimrc
```

### .tmux.conf

```sh
source ~/.dotfiles/.tmux.conf
```

## Useful things to install

* [bat](https://github.com/sharkdp/bat) - Colorized `cat`
* [croc](https://github.com/schollz/croc) - Send files between computers
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Colorized difftool
* [exa](https://the.exa.website/) - Colorized `ls`
* [fd](https://github.com/sharkdp/fd) - Fast find
* [fnm](https://github.com/Schniz/fnm) - Node version manager
* [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
* [Git Extras](https://github.com/tj/git-extras) - Git extensions
* [Git](https://git-scm.com/) - Version control
* [Homebrew](https://brew.sh/) - macOS package manager
* [httpie](https://github.com/httpie/httpie) - HTTP client
* [lazydocker](https://github.com/jesseduffield/lazydocker) - Terminal UI for Docker
* [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for Git
* [nnn](https://github.com/jarun/nnn) - File manager
* [Node.js](https://nodejs.org/) - JavaScript runtime
* [pnpm](https://pnpm.io/) - JavaScript package manager
* [ripgrep](https://github.com/BurntSushi/ripgrep) - Fast `grep`
* [tldr](https://github.com/tldr-pages/tldr) - Simplified man pages
* [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
* [Yarn](https://yarnpkg.com/) - JavaScript package manager
* [Zoxide](https://github.com/ajeetdsouza/zoxide) - Improved `cd`
