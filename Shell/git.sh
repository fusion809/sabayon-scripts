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
  cp -a ~/Shell/* ~/GitHub/sabayon-scripts/Shell && cp -a ~/.bashrc ~/GitHub/sabayon-scripts/
}

# Update sabayon-scripts GitHub repo
function shup {
  cps && cdss && push "$1"
}

# Switch to SSH
function gitsw {
  git remote rm origin
  git remote rm upstream
  git remote add origin git@github.com:fusion809/"${PWD##*/}".git
  git remote add upstream git@github.com:fusion809/"${PWD##*/}".git
}
