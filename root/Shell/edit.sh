function ause {
  cd /etc/portage/package.use/
  select x in `find . -name "*.use"`
  do
     atom $x
    break
  done
}

function akey {
  atom /etc/portage/package.keywords/*.keywords
}

function amask {
  atom /etc/portage/package.mask/*.mask
}

function nhaw {
	nano /etc/portage/package.use/hawaii.use
}

function nkey {
	nano /etc/portage/package.keywords/gentoo.keywords
}

function edsh {
	atom $HOME/Shell
}
