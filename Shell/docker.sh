function dock {
  sudo docker run -ti -v "$PWD"/artifacts:/usr/portage/packages sabayon/builder-amd64 "$@"
}
