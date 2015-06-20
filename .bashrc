alias gs="clear && git status"
alias gcgl="git checkout Gemfile.lock"
alias be="bundle exec"

export PATH="$HOME/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/src/liquidprompt/liquidprompt

# source ~/src/liquidprompt/liquidprompt
