function szsh {
	source $HOME/.zshrc
}

function nzsh {
	nano $HOME/.zshrc
}

function azsh {
	atom $HOME/.zshrc
}

function usb {
	dd bs=4M if="/home/fusion809/VirtualBox VMs/ISO/$@" of="/dev/sdb" && sync
}
