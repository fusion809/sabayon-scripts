# git tools
# Switch to SSH
function gitsw {
  git remote rm origin
  git remote rm upstream
  if [[ -n "$1" ]]
    then
      git remote add origin git@github.com:$1/"${PWD##*/}".git
      git remote add upstream git@github.com:$1/"${PWD##*/}".git
    else
      git remote add origin git@github.com:fusion809/"${PWD##*/}".git
      git remote add upstream git@github.com:fusion809/"${PWD##*/}".git
  fi
}

alias SSH=gitsw
alias gitssh=gitsw
alias gits=gitsw

# Push changes
function push {
  git add . && git commit -m "$1" && git push origin master
}

# Push GitHub pages changes
function pushp {
  git add --all && git commit -m "$1" && git push -u origin master
}

# sabayon-scripts
  ## Update local sabayon-scripts repo
  function cps {
    cp -a ~/Shell/* ~/GitHub/sabayon-scripts/Shell && cp -a ~/.bashrc ~/GitHub/sabayon-scripts/
  }

  ## Update sabayon-scripts GitHub repo
  function shup {
    cps && cdss && push "$1"
  }

# SSH
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
    }
else
    start_agent;
fi
