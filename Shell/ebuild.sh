# Tools for working with https://github.com/fusion809/sabayon-tools repository
#
# Manifests
function manif {
  ebuild $@.ebuild manifest
}

function manifest {
  ebuild "$@" manifest
}

function manall {
  pushd $GHUB/sabayon-tools
    for i in `find . -type f -name "*.ebuild"`
    do
      ebuild $i manifest
    done
  popd
}

function digest {
  ebuild $@.ebuild digest
}

# Manifest, push, install and build pkg
function stup {
  pushd $GHUB/sabayon-tools
    for i in `find . -type f -name "*.ebuild"`
    do
      ebuild $i manifest
    done
    push "$1"
  popd
}

function stupb {
  ebuild $1.ebuild manifest
  push "Updating $1 ebuild and manifest"
}

function bpkgc {
  if [[ -n $@ ]]
  then
    sudo ebuild $@.ebuild manifest clean package merge
  else
    sudo ebuild *.ebuild manifest clean package merge
  fi
}

function bpkgm {
  if [[ -n $@ ]]
  then
    sudo ebuild $@.ebuild manifest package merge
  else
    sudo ebuild *.ebuild manifest package merge
  fi
}

function bpkgf {
  sudo layman -s sabayon-tools
  sudo emerge -abv =$@::sabayon-tools
}

function stf {
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

function edeb {
  L=$(find /usr/portage -type f -name "$1*.ebuild")
  for i in ${L[@]}
  do
    atom $i
  done
}

function ebsch {
  grep -l --include "*$3*.ebuild" -R "$1" /usr/portage/$2
}

function edsch {
  L=$(grep -l --include "*.ebuild" -R "$1" /usr/portage/$2)
  for i in ${L[@]}
  do
    atom $i
  done
}
