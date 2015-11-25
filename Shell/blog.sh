function jekex {
  cdfgi
  bundle exec jekyll serve
}

function blogup {
  pushd $GHUB/fusion809.github.io
  push "$@"
  popd
}
