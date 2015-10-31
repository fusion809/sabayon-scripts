function abash {
	if [[ $# > 0 ]]
		then
			atom ~/Shell/"$1".sh
		else
			atom ~/.bashrc
	fi
}

function abashs {
	pushd ~/Shell
	if [[ -n $1 ]]
	        then
	            atom $1.sh
	        else
	            select x in `find . -name "*.sh"`
	            do
	               atom $x
	            break
	            done
	fi
	popd
}

function sbash {
	source ~/.bashrc
}

function nbash {
	nano ~/.bashrc
}
