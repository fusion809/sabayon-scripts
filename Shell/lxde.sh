# Edit LXDE keyboard shortcuts
function lxkey {
	atom ~/.config/openbox/lxde-rc.xml
}

function amen {
	sudo atom /etc/xdg/menus/ /usr/share/desktop-directories
}

alias amenu=amen

function cpath {
	sudo cp -a /$1/$2 $HOME/GitHub/LXDE-menu/$1
}

function cpmen {
	cpath etc/xdg/menus lxde-applications.menu
	cpath usr/share/desktop-directories lxde*.directory
	cpath usr/share/applications *.desktop
	sudo chmod 777 -R $HOME/GitHub/LXDE-menu
	pushd $HOME/GitHub/LXDE-menu
	git add .
	git commit -m "$@"
	git push origin master
	popd
}
