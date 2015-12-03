# Install a package, but ask first
function ema {
  sudo emerge -av $@
}

# Install a package and build binary
function emb {
  sudo emerge -avb $@
}

alias bpkg=emb

# Build a binary (.tbz2) package to /usr/portage/packages/$CAT ($CAT is the package's category),
# but do not install it
function emB {
  sudo emerge -avB $@
}
alias bpkgo=emB

# Test for dependencies
function emdt {
  sudo emerge -deptest $@
}

# Install package dependencies only and ask before doing so. e.g., emo enlightenment
# would install all of enlightenment's dependencies.
function emo {
  sudo emerge -aov $@ && spm
}

# Pretend to install a package
function emp {
  sudo emerge -pv $@
}

# rev-dep
function emrv {
  sudo revdep-rebuild
}

# Unmerge a package, does not the dependency tree
function emrm {
  sudo emerge -C $@ && spm
}

alias emc=emrm

# Sync Portage Tree and all Layman overlays.
function ems {
  sudo emerge --sync --quiet && sudo layman -Sq
}

alias sync=ems

# Updates all packages in Portage
function emup {
  sudo emerge -uDU --with-bdeps=y @world
}

# Search categories
function cats {
  sudo eix -C -c "$@"
}

alias eixcc=cats
alias eicc=cats

# Track the download progress of packages being installed with Portage
function tailf {
  tail -f /var/log/emerge-fetch.log
}

# Install from list.txt
function emlist {
  sudo emerge -av $(cat "$1".txt)
}
