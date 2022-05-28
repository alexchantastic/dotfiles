# aliases
alias pro="cd ~/Projects"
alias tt='cd $(git rev-parse --show-toplevel)'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Git Extras completions
source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh

# Zsh plugins
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/z
  zgen load nojhan/liquidprompt
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions
  zgen load wfxr/forgit

  zgen save
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
