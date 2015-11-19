function edblog {
  atom $GHUB/fusion809.github.io
}

alias blogedit=edblog
alias bloged=edblog
alias edfgi=edblog

function jekex {
  cdfgi
  bundle exec jekyll serve
}

function blogup {
  pushd $GHUB/fusion809.github.io
  push "$@"
  popd
}
