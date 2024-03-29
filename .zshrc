# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# neovim
alias vi=nvim
export EDITOR=nvim
export VISUAL=nvim

# fnm
eval "$(fnm env --use-on-cd)"

# Powerlevel10k
source ~/.dotfiles/zsh/p10k.zsh

# nnn
source ~/.dotfiles/zsh/nnn.zsh

# bat
source ~/.dotfiles/zsh/bat.zsh

# Plugins
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
antigen bundle Aloxaf/fzf-tab
antigen bundle wfxr/forgit
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

# Functions
cdsh () (
  cd "$1" && shift && zsh -ci "$*"
)

# Aliases
alias ls="exa"
alias lg="lazygit"
alias pn="pnpm"
alias pro="cd ~/Projects"
alias tt='cd $(git rev-parse --show-toplevel)'
alias ttsh='cdsh $(git rev-parse --show-toplevel)'
