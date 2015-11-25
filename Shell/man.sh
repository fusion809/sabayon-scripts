function cpman {
  sudo cp -a /usr/share/man/man$1/$2.$1.bz2 ~/Documents/Manpages
}

function manconv {
  cdman
  sudo chmod 777 -R $2.$1.bz2
  bzip2 -d $2.$1.bz2
  gzip -c $2.$1 > $2.$1.gz
  zcat $2.$1.gz | groff -mandoc -Thtml > $2.$1.html
  sudo chmod 777 -R *
  rm $2.$1.gz $2.$1
}

function manhtml {
  cpman $1 $2 && manconv $1 $2 && cp -a * $HOME/GitHub/fusion809.github.io/man && cd $HOME/GitHub/fusion809.github.io/man
}
