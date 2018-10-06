if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ '

alias ll='ls -la'
alias web='cd ~/Web'

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
