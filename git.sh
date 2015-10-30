# git tools
function push {
  git add . && git commit -m "$1" && git push origin master
}

function pushp {
  git add --all && git commit -m "$1" && git push -u origin master
}
