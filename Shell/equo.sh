# Test for missing dependencies and then install them
function seqd {
	spm && sudo equo deptest
}

alias deptest=seqd

# Test for missing dependencies, quiet the output
function seqdq {
	spm && sudo equo deptest -q
}

alias deptestq=seqdq

# Install a package with Entropy, ask first.
function seqi {
	spm && sudo equo i -av $@
}

alias install=seqi
alias ins=seqi

# Reinstall dependencies of package along with the package itself and all deep
# dependencies
function seqid {
	spm && sudo equo i -av --deep --empty $@
}

alias ined=seqid

# Perform a libtest (looking for missing libraries) with Entropy.
function seql {
	sudo equo libtest
}

alias libtest=seql
alias lt=seql

# Quiet libtest
function seqlq {
	sudo equo libtest -q
}

alias libtestq=seqlq
alias ltq=seqlq

# Mask a package
function seqm {
	spm && sudo equo mask $@
}

alias mask=seqm

# Install package dependencies (and only the dependencies) with Entropy
function seqo {
	spm && sudo equo i -aov $@
}

alias build-dep=seqo
alias builddep=seqo
alias bdep=seqo

# Inflate Portage binary into SPM binary.
function seqpi {
	pushd /usr/portage/packages/$1
	spm && sudo equo pkg inflate $2
	popd
}

alias smart=seqpi
alias seqp=seqpi

# Remove a package with Entropy and all packages that depend on said package
# Ask first. It is advisable to ask first, because sometimes this can remove
# packages you want.

function seqr {
	spm && sudo equo rm -av $@
}

alias remove=seqr
alias rem=seqr

# Update all packages installed with Entropy and make Entropy acknowledge emerged packages
function sequ {
	sudo equo update && sudo equo upgrade --purge && sudo equo cleanup
}

alias update=sequ
alias upgrade=sequ

# Make Entropy acknowledge the existance of emerge packages
function spm {
	sudo equo rescue spmsync
}

alias spmsync=spm
alias seqrs=spm
alias seqs=spm
