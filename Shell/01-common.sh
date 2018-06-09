if [[ $SHELL == "/bin/zsh" ]]; then
    for i in $(dirname "$0")/common-scripts/*.sh
    do
         . "$i"
    done
else
    for i in $HOME/Shell/common-scripts/*.sh
    do
         . "$i"
    done
fi
