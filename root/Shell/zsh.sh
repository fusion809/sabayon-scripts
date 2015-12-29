function szsh {
	source ~/.zshrc
}

function nzsh {
	nano ~/.zshrc
}

function azsh {
	atom ~/.zshrc
}

function usb {
	dd bs=4M if="/home/fusion809/VirtualBox VMs/ISO/$@" of="/dev/sdb" && sync
}
