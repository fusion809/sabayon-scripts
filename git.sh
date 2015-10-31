# git tools
# Push changes
function push {
  git add . && git commit -m "$1" && git push origin master
}

# Push GitHub pages changes
function pushp {
  git add --all && git commit -m "$1" && git push -u origin master
}

# Update local sabayon-scripts repo
function cps {
  cp -a ~/Shell/* ~/GitHub/sabayon-scripts/ && cp -a ~/.bashrc ~/GitHub/sabayon-scripts/
}

# Update sabayon-scripts GitHub repo
function shup {
  cps && cdss && push $1
}
