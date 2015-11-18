function trinity {
  ./configure $@ && make && sudo make install
}

function trinusr {
  ./configure --prefix=/usr "$@" && make && sudo make install
}

function bmod {
  ./autogen.sh --prefix=/usr "$@" && make && sudo make install
}

alias atrin=bmod

function cmtrin {
  mkdir build && cd build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr && make && sudo make install
}

function ctrin {
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr && make && sudo make install
}
