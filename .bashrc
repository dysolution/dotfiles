if [ -f ~/.bashrc.private ]; then
     source ~/.bashrc.private
fi

export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export GOBIN=$HOME/bin
export GOPATH=$HOME
export HISTCONTROL=ignorespace
export MINIMUM_IMAGES_TO_SAVE=1 # make docker-gc keep only the most recent image for each repo

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/opt/python/libexec/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$HOME/.cargo/bin" # cargo package manager for Rust
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

export TERM=screen-256color
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog # for AsciiDoc a2x

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/src/github.com/nojhan/liquidprompt/liquidprompt

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

eval $(thefuck --alias)

function decode-kubernetes-secret {
  kubectl get secret $@ -o json | jq '.data | map_values(@base64d)'
}

function cover () {
    local t=$(mktemp -t cover)
    go test $COVERFLAGS -coverprofile=$t $@ \
        && go tool cover -func=$t \
        && unlink $t
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# if [ -f ~/.bash_nvm ]; then
#   source ~/.bash_nvm
# fi

