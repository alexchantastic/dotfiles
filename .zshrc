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

# nvm
NVM_HOMEBREW=$(brew --prefix nvm)

# Antigen
source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle copybuffer
antigen bundle copyfile
antigen bundle copypath
antigen bundle fzf
antigen bundle git-extras
antigen bundle gitfast
antigen bundle npm
antigen bundle nvm
antigen bundle yarn
antigen bundle zoxide
antigen bundle nojhan/liquidprompt
antigen bundle wfxr/forgit
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
