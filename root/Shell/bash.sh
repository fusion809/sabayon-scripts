function abash {
	pushd ~/Shell
		select x in `find . -name "*.sh"`
		do
			 atom $x
			break
		done
	popd
}

function nbash {
	nano ~/.bashrc
}

function sbash {
	source ~/.bashrc
}
