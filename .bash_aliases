# git aliases
alias gap="clear && git add -p"

alias gc="git commit"
alias gca="git commit --amend"
alias gcv="git commit -v"

alias gco="git checkout"

alias gd="git diff -w"
alias gdc='git diff -w --cached'
alias gdd="clear && git diff -w develop"

alias glo="git log --pretty=oneline --abbrev-commit"

alias glp="git log -p -w"

alias gpa="git checkout develop && git pull && git checkout master && git pull"
alias gs="clear && git status"

# to help with deployment
alias gt="git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags | awk -v OFS='\t' '{print \$1, \$2}'"
alias l="ls -aF"

alias vd="git difftool --tool=vimdiff --no-prompt"

# other aliases
alias be="bundle exec"
alias dc='docker-compose'
alias dm='docker-machine'
alias gonotes='vim ~/Dropbox/dev/gonotes.md'
alias ll='ls -FGal'
alias notes='vim ~/notes.ad'

alias cl="cirrus ls"
alias clb="cirrus ls b"
alias clc="cirrus ls c"
alias clp="cirrus ls p"
alias cls="cirrus ls s"
alias cdcirrus="cd ~/src/gitlab.amer.gettywan.com/esp/cirrus/"

alias docker-gc="docker run --rm --userns host -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc cafecr.azurecr.io/cafe/docker-gc"

alias ".."="cd .."

alias mux="tmuxinator"
alias azl="az login --use-device-code"

alias dks="decode-kubernetes-secret"
