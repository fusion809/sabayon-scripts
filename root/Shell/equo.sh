function mask {
	equo mask $@
}

function spm {
	equo rescue spmsync
}

alias spmsync=spm

function eqin {
	equo i $@
}

alias install=eqin
alias eqi=eqin
alias in=eqin

function eqrm {
	equo remove $@
}

alias remove=eqrm
alias eqr=eqrm

function eqtest {
	equo libtest -q && equo deptest -q
}

function update {
	equo rescue spmsync && equo update && equo upgrade --purge
}

function purge {
	equo upgrade --purge
}

function dislim {
	mv /etc/entropy/repositories.conf.d/entropy_sabayon-limbo /etc/entropy/repositories.conf.d/_entropy_sabayon-limbo
	equo update && equo upgrade
}

function enlim {
	mv /etc/entropy/repositories.conf.d/_entropy_sabayon-limbo /etc/entropy/repositories.conf.d/entropy_sabayon-limbo
	equo update && equo upgrade
}
