function update {
	sudo equo rescue spmsync && sudo equo update && sudo equo upgrade --purge && sudo equo cleanup
}

function install {
	sudo equo i -av $@
}

alias seqi=install
alias ins=install

function remove {
	sudo equo rm -av $@
}

alias seqr=remove
alias rem=remove

function spm {
	sudo equo rescue spmsync
}

alias spmsync=spm
alias seqrs=spm

function bdep {
	sudo equo i -aov $@
}

alias build-dep=bdep
alias builddep=bdep

function ined {
	sudo equo i -av --deep --empty $@
}
