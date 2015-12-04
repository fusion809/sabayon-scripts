# SDDM
function asddm {
  atom /etc/sddm.conf
}

alias asd=asddm
alias asdd=asddm

function nsddm {
  nano /etc/sddm.conf
}

alias nsd=nsddm
alias nsdd=nsddm

function lsddm {
  pushd /usr/share/sddm/themes/
  ls
  popd
}
