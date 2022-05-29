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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

NVM_HOMEBREW=$(brew --prefix nvm)

# Antigen
source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle nvm
antigen bundle git-extras
antigen bundle npm
antigen bundle yarn
antigen bundle zoxide
antigen bundle copyfile
antigen bundle copypath
antigen bundle copybuffer
antigen bundle gitfast
antigen bundle nojhan/liquidprompt
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle wfxr/forgit

antigen apply
