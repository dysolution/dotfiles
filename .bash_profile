eval "$(~/getty/dev/esp/scripts/bin/esp init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi
