# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

dotfiles=~/.dotfiles

# neovim
alias vi=nvim
export EDITOR=nvim
export VISUAL=nvim

# fnm
eval "$(fnm env --use-on-cd)"

# Powerlevel10k
source "$dotfiles/zsh/p10k.zsh"

# nnn
source "$dotfiles/zsh/nnn.zsh"

# bat
source "$dotfiles/zsh/bat.zsh"

# fzf
source "$dotfiles/zsh/fzf.zsh"

# Plugins
antidote load "$dotfiles/zsh/.zsh_plugins.txt"
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# Functions
cdsh () (
  cd "$1" && shift && zsh -ci "$*"
)

# Aliases
alias lg="lazygit"
alias pn="pnpm"
alias pro="cd ~/Projects"
alias tt='cd $(git rev-parse --show-toplevel)'
alias ttsh='cdsh $(git rev-parse --show-toplevel)'
