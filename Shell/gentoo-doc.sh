function ghand {
  # Input 1 is the architecture
  # Input 2 is the Page name.
  mkdir -p ~/Textbooks/Gentoo/$1/$2/..
  cd ~/Textbooks/Gentoo/$1/$2/..
  wkhtmltopdf https://wiki.gentoo.org/wiki/Handbook:"$1"/"$2" "${2##*/}".pdf
}

function ghandall {

  # Installation
  S=Installation
  L=('About' 'Base' 'Bootloader' 'Disks' 'Finalizing' 'Kernel' 'Media' 'Networking' 'Stage' 'System' 'Tools')
  for i in "${L[@]}"
  do
    ghand $1 "$S"/"$i"
  done
  unset L
  unset S

  # Working with Gentoo
  S=Working
  L=('EnvVar' 'Features' 'Initscripts' 'Portage' 'USE')
  for i in "${L[@]}"
  do
    ghand $1 "$S"/"$i"
  done
  unset L
  unset S

  # Working with Portage
  S=Portage
  L=('Advanced' 'Branches' 'CustomTree' 'Files' 'Tools' 'Variables')
  for i in "${L[@]}"
  do
    ghand $1 "$S"/"$i"
  done
  unset L
  unset S

  # Networking
  S=Networking
  L=('Advanced' 'Dynamic' 'Extending' 'Introduction' 'Modular' 'Wireless')
  for i in "${L[@]}"
  do
    ghand $1 "$S"/"$i"
  done
  unset L
  unset S
}

function unit {
  cd ~/Textbooks/Gentoo/$1
  pdfunite $1.pdf */*.pdf output.pdf
}
