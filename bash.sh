function abash {
	if [[ $# > 0 ]]
		then
			atom ~/Shell/"$1".sh
		else
			atom ~/.bashrc
	fi
}

function sbash {
	source ~/.bashrc
}

function nbash {
	nano ~/.bashrc
}
