#ebuild tools
function manif {
  ebuild $@.ebuild manifest
}

function digest {
  ebuild $@.ebuild digest
}
