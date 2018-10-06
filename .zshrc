# aliases
alias web="cd ~/Web"

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# zsh plugins
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/z
  zgen load nojhan/liquidprompt
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions

  zgen save
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
