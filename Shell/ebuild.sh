#ebuild tools
function manif {
  ebuild $@.ebuild manifest
}

function manifest {
  ebuild "$@" manifest
}

function bpkg {
  manif $@
  push "Updating manifest and $@"
  sudo layman -s sabayon-tools
  sudo emerge -abv =$@::sabayon-tools
}

function bpkgf {
  sudo layman -s sabayon-tools
  sudo emerge -abv =$@::sabayon-tools
}

function bpkgon {
  manif $@
  push "Updating manifest and $@"
  sudo layman -s sabayon-tools
  sudo emerge -B =$@::sabayon-tools
}

function bpkgonf {
  sudo layman -s sabayon-tools
  sudo emerge -B =$@::sabayon-tools
}

function digest {
  ebuild $@.ebuild digest
}
