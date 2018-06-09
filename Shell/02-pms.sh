if [[ $SHELL == "/bin/zsh" ]]; then
    for i in $(dirname "$0")/pms/*.sh
    do
         . "$i"
    done
else
    for i in $HOME/Shell/pms/*.sh
    do
         . "$i"
    done
fi
