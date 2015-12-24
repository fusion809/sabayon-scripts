# APM
function apmi {
  apm install $@
}

function apml {
  apm list
}

alias apmlist=apml

function apmrm {
  apm remove $@
}

function apmup {
  apm update
}

alias apmu=apmup
alias apmupdate=apmup

# Atom Building
function atb {
  script/build && sudo script/grunt install --install-dir /usr
}

function atbeta {
  script/build && sudo script/grunt install --install-dir /usr/local
}

# Edit functions
function edblog {
  atom $GHUB/fusion809.github.io
}

alias blogedit=edblog
alias bloged=edblog
alias edfgi=edblog

function edram {
  atom $HOME/RAM
}

function edrsh {
  sudo atom /root/Shell
}

function edsh {
  atom $HOME/Shell
}

alias edshell=edsh
alias shelled=edsh

function edst {
  atom $GHUB/sabayon-tools
}

# Defining atom-beta
function atom-beta {
  /usr/local/bin/atom
}

# View Portage Tree
function edpt {
  atom /usr/portage/
}
