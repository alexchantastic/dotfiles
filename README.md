# dotfiles

My personal collection of dotfiles.

## Requirements

* [zgen](https://github.com/tarjoilija/zgen) - Zsh plugin manager
* [liquidprompt](https://github.com/nojhan/liquidprompt) - Bash prompt
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Difftool

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

### .bashrc

```sh
source ~/.dotfiles/.bashrc
```

### .gitconfig

```
[include]
    path= ~/.dotfiles/.gitconfig
```

### .vimrc

```sh
source ~/.dotfiles/.vimrc
```

## Useful things to install

* [Homebrew](https://brew.sh/) - MacOS package manager
* [Git](https://git-scm.com/) - Version control
* [nvm](https://github.com/creationix/nvm) - Node version manager
* [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
* [fd](https://github.com/sharkdp/fd) - Fast find
* [ack](https://beyondgrep.com/) - Fast grep
* [tldr](https://github.com/tldr-pages/tldr) - Simplified man pages
