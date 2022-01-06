# aliases
alias web="cd ~/Web"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Git Extras completions
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# zsh plugins
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/z
  zgen load nojhan/liquidprompt
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions

  zgen save
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
