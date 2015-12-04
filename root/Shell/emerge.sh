function sync {
	emerge --sync && layman -S
}

function list {
	layman -L
}

function read {
	eselect news read
}

function unm {
	emerge --unmerge =$@
}

function emup {
	emerge -uDU --autounmask-write --with-bdeps=y @world
}

function pres {
	emerge --keep-going @preserved-rebuild
}

alias rebuild=pres

function ause {
	atom /etc/portage/package.use/gentoo.use
}

function amask {
	atom /etc/portage/package.mask/gentoo.mask
}

function akey {
	atom /etc/portage/package.keywords/gentoo.keywords
}

function amake {
	atom /etc/portage/make.conf
}
