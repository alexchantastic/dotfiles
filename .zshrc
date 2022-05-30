# functions
cdsh () (
  cd "$1" && shift && command "$@"
)

# aliases
alias lg="lazygit"
alias pro="cd ~/Projects"
alias tt='cd $(git rev-parse --show-toplevel)'
alias ttsh='cdsh $(git rev-parse --show-toplevel)'

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# fnm
eval "$(fnm env --use-on-cd)"

# Antigen
source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle copybuffer
antigen bundle copyfile
antigen bundle copypath
antigen bundle fzf
antigen bundle git-extras
antigen bundle gitfast
antigen bundle httpie
antigen bundle npm
antigen bundle yarn
antigen bundle zoxide
antigen bundle wfxr/forgit
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply
