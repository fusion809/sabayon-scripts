function cdap {
	cd /usr/share/applications
}

function cdb {
	cd /usr/share/backgrounds
}

function cdent {
	cd /var/tmp/entropy
}

function cdk {
	cd /etc/portage/package.keywords
}

function cdl {
	cd /etc/lightdm
}

function cdgap {
	cd /usr/share/games/applications
}

alias cdg=cdgap

function cdlgap {
	cd /usr/local/share/games/applications
}

alias cdlg=cdlgap

function cdlap {
	cd /usr/local/share/applications
}

function cdm {
	cd /etc/portage/package.mask
}

function cdmenu {
	cd /etc/xdg/menus/
}

alias cdme=cdmenu
alias cdmen=cdmenu
alias cdmenus=cdmenu
alias cdapm=cdmenu

# Portage Tree
PT=/usr/portage
function cdpt {
	cd $PT
}

function cdpd {
	cd $PT/distfiles/
}

function cdpack {
	cd $PT/packages/
}

# SDDM themes
function cds {
	cd /usr/share/sddm/themes/
}

function cdsh {
	cd ~/Shell
}

function cdsmart {
	cd /var/lib/entropy/smartpackages/amd64
}

function cdu {
	cd /etc/portage/package.use
}

function cdx {
	cd /usr/share/xsessions
}
