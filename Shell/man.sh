function manhtml {
  # First input is the man page number.
  # Second input is the man page name.
  bzcat /usr/share/man/man$1/$2.$1.bz2 | man2html > $HOME/GitHub/fusion809.github.io/man/$2.$1.html
  sudo chmod 777 -R $HOME/GitHub/fusion809.github.io/man/$2.$1.html
}

function manhtmld {
  bzcat /usr/share/man/man$1/$2.$1.bz2 | man2html > $HOME/Documents/Manpages/$2.$1.html
  sudo chmod 777 -R $HOME/Documents/Manpages/$2.$1.html
}
