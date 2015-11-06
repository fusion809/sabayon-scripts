# Atom
function apmi {
  apm install $@
}

function apmup {
  apm update
}

alias apmu=apmup
alias apmupdate=apmup

function atin {
	script/build && sudo script/grunt install
}

alias atb=atin

# Command-line programs
function octcli {
	octave --no-gui
}

function opt {
  optipng -o7 $@.png
}

# Edit OpenBox Keybindings
function obedit {
	atom ~/.config/openbox/lxde-rc.xml
}

function opconf {
	openbox --reconfigure
}

# Launch FVWM
function fvwmex {
  exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm
}

function cploc {
  cp -a "/home/fusion809/Desktop/VirtualBox machines/"*.desktop /home/fusion809/.local/share/applications/
}

function theme {
  git clone https://github.com/JeffHoogland/$1
  cd $1
  git remote add upstream https://github.com/JeffHoogland/$1
  cd $1
  chmod +x build.sh
  ./build.sh
  cd ..
  cp -a $1.edj ~/.e/e/themes/
  cd ..
}

function pbuild {
  packer build -only=virtualbox-iso "$@"
}

function hweb {
  hugo server --theme=hyde --buildDrafts --appendPort=true -w true
}
