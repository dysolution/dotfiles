
if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -n "$BASH" ] && [ -r ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# tab completion for branches
if [ -n "$BASH" ] && [ -r ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -n "$BASH" ]; then
  source ~/src/github.com/tmuxinator/tmuxinator/completion/tmuxinator.bash
fi

# tab completion for CDPATH
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [ -f ~/.esp ]; then
  source ~/.esp
fi

if [ -f ~/.esp ]; then
  eval "$($HOME/src/gitlab.getty.cloud/esp/scripts/bin/esp init -)"
fi

export PATH="/usr/local/opt/ruby/bin:$PATH"
