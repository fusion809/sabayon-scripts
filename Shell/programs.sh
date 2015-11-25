# Command-line programs
function octcli {
	octave --no-gui
}

function opt {
  optipng -o7 $@.png
}

function screenshot {
	xfce4-screenshooter > output.png && optipng -o7 output.png
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
