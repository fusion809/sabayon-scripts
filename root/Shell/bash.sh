function abash {
	pushd $HOME/Shell
		select x in `find . -name "*.sh"`
		do
			 atom $x
			break
		done
	popd
}

function nbash {
	nano $HOME/.bashrc
}

function sbash {
	source $HOME/.bashrc
}
