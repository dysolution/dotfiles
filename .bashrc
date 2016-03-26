if [ -f ~/.bashrc.private ]; then
     source ~/.bashrc.private
fi

# git aliases
alias gap="clear && git add -p"
alias gc="git commit"
alias gca="git commit --amend"
alias gcgl="git checkout Gemfile.lock"
alias gco="git checkout"
alias gd="git diff"
alias gdc='git diff --cached'
alias gdd="clear && git diff develop"
alias glp="git log -p"
alias gs="clear && git status"

alias vd="git difftool --tool=vimdiff --no-prompt"

# other aliases
alias be="bundle exec"
alias dc='docker-compose'
alias dm='docker-machine'
alias gonotes='vim ~/Dropbox/dev/gonotes.md'
alias ll='ls -alF'
alias notes='vim ~/notes.ad'

export PATH="/usr/local/sbin:$HOME/bin:$PATH" # Add RVM to PATH for scripting
export GOPATH=$HOME

export XML_CATALOG_FILES=/usr/local/etc/xml/catalog # for AsciiDoc a2x

 #Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/src/liquidprompt/liquidprompt

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
