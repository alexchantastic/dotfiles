# dotfiles

My personal collection of dotfiles.

## Requirements

* [zsh](http://www.zsh.org/) - Unix shell
* [zgen](https://github.com/tarjoilija/zgen) - Zsh plugin manager
* [liquidprompt](https://github.com/nojhan/liquidprompt) - Bash prompt
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Colorized difftool

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

### .bash_profile

```sh
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
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

## Useful things to install

* [ack](https://beyondgrep.com/) - Fast grep
* [bat](https://github.com/sharkdp/bat) - Colorized cat
* [fd](https://github.com/sharkdp/fd) - Fast find
* [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
* [Git](https://git-scm.com/) - Version control
* [Homebrew](https://brew.sh/) - MacOS package manager
* [nvm](https://github.com/creationix/nvm) - Node version manager
* [tldr](https://github.com/tldr-pages/tldr) - Simplified man pages
* [Yarn](https://yarnpkg.com/) - JavaScript package manager
