# dotfiles

My personal collection of dotfiles.

## Requirements

* [zsh](http://www.zsh.org/) - Unix shell
* [Antigen](https://github.com/zsh-users/antigen) - zsh plugin manager
* [Vundle](https://github.com/VundleVim/Vundle.vim) - Vim plugin manager

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

## Useful things to install

* [ack](https://beyondgrep.com/) - Fast `grep`
* [bat](https://github.com/sharkdp/bat) - Colorized `cat`
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Colorized difftool
* [fd](https://github.com/sharkdp/fd) - Fast find
* [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
* [Git Extras](https://github.com/tj/git-extras) - Git extensions
* [Git](https://git-scm.com/) - Version control
* [Homebrew](https://brew.sh/) - macOS package manager
* [httpie](https://github.com/httpie/httpie) - HTTP client
* [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for Git
* [fnm](https://github.com/Schniz/fnm) - Node version manager
* [tldr](https://github.com/tldr-pages/tldr) - Simplified man pages
* [Yarn](https://yarnpkg.com/) - JavaScript package manager
* [Zoxide](https://github.com/ajeetdsouza/zoxide) - Improved `cd`
