function cdm {
	cd ~/Music
}

function cdman {
	cd ~/Documents/Manpages
}
alias cdmn=cdman

# MediaWiki
MW=/var/www/localhost/htdocs/w
alias mw=MW
function cdmw {
	cd $MW
}

function cdmwe {
	cd $MW/extensions
}

function cdmwi {
	cd $MW/images
}

function cdmwm {
	cd $MW/maintenance
}

#----- End of MediaWiki -----#

function cdps {
		cd ~/ps_mem
}

# Programs

function cdp {
	cd ~/Programs
}

function cdat {
	cd ~/Programs/atom*
}

function cdmok {
	cd ~/Programs/Moksha
}

function cdst {
	cd ~/Programs/sabayon-tools
}
# Pictures
function cdpi {
	cd ~/Pictures
}

function cdi {
	cd ~/Pictures/Icons
}

function cds {
	cd ~/Pictures/Screenshots
}

#- End of Pictures -#

function cdsh {
	cd ~/Shell
}

# Applications
AP=~/.local/share/applications
function cdap {
	cd $AP
}

function cdvap {
	cd $AP/VirtualBox
}

# VirtualBox
function cdv {
	cd ~/"VirtualBox VMs"
}

function cddotv {
	cd ~/.VirtualBox/Machines/
}

function cdvbm {
	cd "/home/fusion809/Desktop/VirtualBox machines"
}

alias cdvb=cdvbm
#- End of VirtualBox -#

# WordPress
WP=/var/www/localhost/htdocs/wp
alias wp=WP
WP_CON=$WP/wp-content
alias wp_con=WP_CON

function cdwp {
	cd $WP
}

function cdwpp {
	cd $WP_CON/plugins
}

function cdwpt {
	cd $WP_CON/themes
}

function cdwpu {
	cd $WP_CON/uploads
}

#- End of WordPress -#

function cdy {
	cd "/home/fusion809/Videos/YouTube"
}

function cdg {
	cd ~/GitHub/
}
