function mdocin {
  # Install mandoc
  if [[ -n $1 ]]
    then
      wget -cqO- http://mdocml.bsd.lv/snapshots/mdocml-$1.tar.gz | tar -xz
      pushd mdocml-$1
    else
      wget -cqO- http://mdocml.bsd.lv/snapshots/mdocml-1.13.3.tar.gz | tar -xz
      pushd mdocml-1.13.3
  fi
  ./configure --prefix=/usr 2> config_err.txt && make && sudo make install DESTDIR=/
  popd
}

function manhtml {
  # First input is the man page number.
  # Second input is the man page name.
  bzcat /usr/share/man/man$1/$2.$1.bz2 | mandoc -Thtml > $HOME/GitHub/fusion809.github.io/man/$2.$1.html
  sudo chmod 777 -R $HOME/GitHub/fusion809.github.io/man/$2.$1.html
}

function manhtmld {
  bzcat /usr/share/man/man$1/$2.$1.bz2 | mandoc -Thtml > $HOME/Documents/Manpages/$2.$1.html
  sudo chmod 777 -R $HOME/Documents/Manpages/$2.$1.html
}

function manhtmlp {
  L=$(equery files "$1" | grep /usr/share/man/man)
  ext=${L##*.}
  CHAR=$((${#ext}+1))
  for i in $L
  do
    if [ ${i: -$CHAR} == ".$ext" ]
    then
      if [ -z $k ]; then unset k; fi
      k=$(basename $i | sed 's/\(.*\)\..*/\1/')
      bzcat $i | mandoc -Thtml > ~/GitHub/fusion809.github.io/man/$k.html
      sudo chmod 777 -R ~/GitHub/fusion809.github.io/man/$k.html
    fi
  done
}

function manhtmlci {
  CL=$(eix -CIc# $1)
  for j in $CL
  do
    manhtmlp $j
  done
}

function mans {
  equery files "$1" | grep /usr/share/man/man
}

function docs {
  equery files "$1" | grep /usr/share/doc
}
