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
	sudo dd bs=4M if="$@.iso" of="/dev/sdb" && sudo sync
}
