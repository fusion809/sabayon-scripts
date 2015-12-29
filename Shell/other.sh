# Launch FVWM
function fvwmex {
  exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm
}

function cploc {
  cp -a "/home/fusion809/Desktop/VirtualBox machines/"*.desktop /home/fusion809/.local/share/applications/VirtualBox
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

function modbuild {
  pushd ~/Programs/moksha-modules-extra-master
    for i in `find . -maxdepth 1 -type d -exec basename {} \;`
    do
      pushd $i
        ./autogen.sh --prefix=/usr && make && sudo make install
      popd
    done
  popd
}

function pk {
	for i in "$@"
	do
	sudo pkill "$i"
	done
}
