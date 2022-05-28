# functions
cdsh () (
  cd "$1" && shift && command "$@"
)

# aliases
alias pro="cd ~/Projects"
alias tt='cd $(git rev-parse --show-toplevel)'
alias ttsh='cdsh $(git rev-parse --show-toplevel)'

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide
eval "$(zoxide init zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Git
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh

# Antigen
source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle nojhan/liquidprompt
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle wfxr/forgit

antigen apply
