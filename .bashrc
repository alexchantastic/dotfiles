# liquidprompt
if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi

# colors
export TERM=xterm-color
export GREP_OPTIONS="--color=auto" GREP_COLOR="1;32"
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
PS1="\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ "

# aliases
alias ll="ls -la"
alias web="cd ~/Web"

# git completion
if [ -f ./.git-completion.bash ]; then
    . ./.git-completion.bash
fi

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
