function ps_mem {
  python /home/fusion809/ps_mem/ps_mem.py -p $@
}

function tasks {
  ps -efH
}

function pasteit {
  pastebinit -i $@ -b http://paste2.org
}

function sport {
  grep --include="$1.ebuild" -R "$2" /usr/portage
}

function binb {
  echo $1 >> $2 && chmod +x $2
}
