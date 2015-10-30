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

function cpman {
  sudo cp -a /usr/share/man/man$1/$2.$1.bz2 ~/Documents/Manpages
}

function manconv {
  cdman
  sudo chmod 777 -R $2.$1.bz2
  bzip2 -d $2.$1.bz2
  gzip -c $2.$1 > $2.$1.gz
  zcat $2.$1.gz | groff -mandoc -Thtml > $2.$1.html
  sudo chmod 777 -R $2.$1.html
  rm $2.$1.bz2 $2.$1.gz $2.$1
}

function manhtml {
  cpman $1 $2 && manconv $1 $2
}

function theme {
  git clone https://github.com/JeffHoogland/$1 && cd $1 && git remote add upstream https://github.com/JeffHoogland/$1 && cd $1 && ./build.sh && cd .. && cp -a $1.edj ~/.e/e/themes/ && cd ..
}
