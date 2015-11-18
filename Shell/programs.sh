# Atom
function apmi {
  apm install $@
}

function apmup {
  apm update
}

alias apmu=apmup
alias apmupdate=apmup

# Command-line programs
function octcli {
	octave --no-gui
}

function opt {
  optipng -o7 $@.png
}

function pbuild {
  packer build -only=virtualbox-iso "$@"
}

function hweb {
  hugo server --theme=hyde --buildDrafts --appendPort=true -w true
}

function 7zcom {
  7z a "$@.7z" "$@"
}
