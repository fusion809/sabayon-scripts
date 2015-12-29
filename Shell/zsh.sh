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
	sudo dd bs=4M if="$@.iso" of="/dev/sdb" && sudo sync
}
