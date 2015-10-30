# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

. ~/Shell/bash.sh
. ~/Shell/cd.sh
. ~/Shell/compile.sh
. ~/Shell/conv.sh
. ~/Shell/ebuild.sh
. ~/Shell/emerge.sh
. ~/Shell/equo.sh
. ~/Shell/git.sh
. ~/Shell/lxde.sh
. ~/Shell/memory.sh
. ~/Shell/multimedia.sh
. ~/Shell/mw.sh
. ~/Shell/other.sh
. ~/Shell/variables.sh

# Put your fun stuff here.
