function ghand {
  # Input 1 is the architecture
  # Input 2 is the Page name.
  mkdir -p ~/Textbooks/Gentoo/$1/$2/..
  cd ~/Textbooks/Gentoo/$1/$2/..
  wkhtmltopdf https://wiki.gentoo.org/wiki/Handbook:"$1"/"$2" "${2##*/}".pdf
}

function ghandall {
  mkdir -p ~/Textbooks/Gentoo/$1 && cd ~/Textbooks/Gentoo/$1
  wkhtmltopdf https://wiki.gentoo.org/wiki/Handbook:"$1" "$1".pdf

  # Installation
  L=('Installation' 'Working' 'Portage' 'Networking')
  for i in "${L[@]}"
  do
    wkhtmltopdf https://wiki.gentoo.org/wiki/Handbook:"$1"/Full/"$i" "$i".pdf
  done
}

function unit {
  ghandall "$1"
  pdfunite Installation.pdf Working.pdf Portage.pdf Networking.pdf ""$1"-Handbook".pdf
}
