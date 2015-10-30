function emup {
    sudo emerge -uDU --with-bdeps=y @world
}

function emrm {
    sudo emerge --unmerge $@
}

function ema {
    sudo emerge -av $@
}

function emp {
    sudo emerge -pv $@
}

function sync {
    sudo emerge --sync && sudo layman -S
}

function tailf {
        tail -f /var/log/emerge-fetch.log
}

function emo {
  sudo emerge -aov $@
}
