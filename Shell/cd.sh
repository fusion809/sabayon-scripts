function cdm {
	cd ~/Music
}

function cdch {
	cd ~/chroots
	echo "Howdy, this directory is to be used for distribution tarballs. chrootb will unmount the chroot at /root2 while schroot2 will \
remount it after rebooting."
}

function cdman {
	cd ~/Documents/Manpages
}
alias cdmn=cdman

# MediaWiki
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

function cdph {
	cd ~/Programs/Hawaii
}

alias cdhaw=cdph

function cdat {
	cd ~/Programs/atom*
}

function cdmok {
	cd ~/Programs/Moksha
}

function cdmokm {
	cd ~/Programs/Moksha/moksha-modules-extra-master
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

	function cdshx {
		cd ~/Shellex
	}

	function cdoct {
		cd ~/"GNU Octave"
	}

	function cdsm {
		cd ~/SageMath
	}

# Applications
	function cdap {
		cd $AP
	}

	function cdvap {
		cd $AP/VirtualBox
	}

	alias cdapv=cdvap

	# Icons
	function cdic {
		cd $IC
	}

# VirtualBox
	function cdv {
		cd "$HOME/VirtualBox VMs"
		echo "Welcome to the relm of VirtualBox VMs, ISOs, VDIs and VMDKs, etc."
	}

	function cdvi {
		cd "$HOME/VirtualBox VMs/ISO"
	}

	function cdvdi {
		cd "$HOME/VirtualBox VMs/Virtual Disk Image"
	}

	function cdvbm {
		cd "$HOME/Desktop/VirtualBox machines"
	}

	alias cdvb=cdvbm
#- End of VirtualBox -#

# WordPress

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
	cd ~/Videos/YouTube
}

function cdvs {
	cd ~/Videos/Spec
}

# GitHub
function cdg {
	cd ~/GitHub/
}

	function cdgp {
		cd $PAK
	}

	alias cdpak=cdgp

		function cdgpa {
			cd $PAK/arch-builder
		}

		alias cdarch=cdgpa
		alias cdar=cdgpa
		alias cdgab=cdgpa
		alias cdpab=cdgpa
		alias cdab=cdgpa

		function cdgen {
			cd $PAK/gentoo-packer
		}

		function cdsp {
			cd $PAK/sabayon-packer
		}

	function cdms {
		cd ~/GitHub/moksha-scripts
	}

	function cdfor {
		cd $HOME/GitHub/for-gentoo
		echo "Attention! You may wish to run `git pull upstream master` to get upstream commits. Any commit messages you write should follow the \
the schema used by this repo. For example, for Atom bumps use: `[app-editors/atom] bump, remanifest`"
	}

	alias cdfg=cdfor

	function cdss {
		cd ~/GitHub/sabayon-scripts
	}

	function cdgs {
		cd ~/GitHub/sabayon-tools
	}

	alias cdst=cdgs

	function cdlx {
		cd $HOME/GitHub/LXDE-menu
	}

	function cdfgi {
		cd ~/GitHub/fusion809.github.io
	}

	function cdgf {
		cd ~/GitHub/hugo-website
	}

	alias cdweb=cdgf

function cdt {
	cd ~/Textbooks
}
