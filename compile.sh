function trinity {
  ./configure $@ && make && sudo make install
}

function trinusr {
  ./configure --prefix=user $@ && make && sudo make install
}

function bmod {
  ./autogen.sh --prefix=/usr && make && sudo make install
}

function cmtrin {
  mkdir build && cd build && cmake .. && make && sudo make install
}
