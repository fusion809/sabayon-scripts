# root2 enters a chroot in the /root2 directory. To generate such a chroot
# (which is necessary before entering it) use gentoo-chrootn or sabayon-chrootn
# Upon rebooting, however, you may wish to run chrootb, as otherwise your chroot
# will take up a lot of your RAM leading to program crashes. DON'T RUN chrootb
# BEFORE REBOOTING AS IT CAN CAUSE DAMAGE TO YOUR SYSTEM!
function root2 {
  sudo chroot /root2 /bin/bash
}

function gentoo-chrootn {
  # First input ($1) is usually 2, unless you want to set up multiple chroots
  # Second input refers to the release date of the stage3 tarball being used.
  # Go to
  # http://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64/
  # As of 25 November 2015 the latest release was on 19 November 2015 and
  # to get it, you would use the second input 20151119
  # e.g., gentoo-chrootn 2 20151119, would create a chroot at /root2 for the
  # 20151119 stage3 tarball.
  if [[ $1 > 1 ]]
    then
      wget -c http://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-$2.tar.bz2
      sudo mkdir /root$1
      sudo cp -a stage3-amd64-$2.tar.bz2 /root$1
      cd /root$1
      sudo tar xvjpf stage3-amd64-$2.tar.bz2
      sudo mount -t proc none /root$1/proc
      sudo mount -o bind /dev /root$1/dev
      sudo mkdir usr/portage
      sudo mount -o bind /usr/portage /root$1/usr/portage
      sudo mkdir usr/src/linux
      sudo mount -o bind /usr/src/linux /root$1/usr/src/linux
      sudo mkdir lib/modules
      sudo mount -o bind /lib/modules /root$1/lib/modules
      sudo mount -o bind /sys /root$1/sys
      sudo cp /etc/resolv.conf /root$1/etc/resolv.conf
      sudo mount -o bind /tmp /root$1/tmp
      sudo mount --rbind /dev /root$1/dev
      sudo mount --rbind /sys /root$1/sys
  fi
}

function chrootb {
  sudo umount /root2/proc
  sudo umount /root2/dev
  sudo umount /root2/usr/portage
  sudo umount /root2/usr/src/linux
  sudo umount /root2/lib/modules
  sudo umount /root2/sys
  sudo umount /root2/tmp
  sudo umount /root2/dev
  sudo umount /root2/sys
}

function sabayon-mirror {
  ## Declare the associative array
  declare -A L=(
  [Argentina 1]="ftp://mirrors.coopvgg.com.ar/sabayon"                            [Argentina 2]="http://mirrors.coopvgg.com.ar/sabayon"
  [Austria 1]="ftp://gd.tuwien.ac.at/linux/sabayonlinux"                          [Austria 2]="http://gd.tuwien.ac.at/linux/sabayonlinux"
  [Australia 1 FTP Internode]="ftp://mirror.internode.on.net/pub/sabayon"         [Australia 2 HTTP Internode]="http://mirror.internode.on.net/pub/sabayon"
  [Australia 3 FTP OptusNet]="ftp://mirror.optusnet.com.au/sabayon"               [Australia 4 FTP OptusNet]="http://mirror.optusnet.com.au/sabayon"
  [Belgium 1]="ftp://ftp.belnet.be/mirror/sabayonlinux"                           [Belgium 2]="http://ftp.belnet.be/mirror/sabayonlinux"
  [Brazil 1]="ftp://sabayon.c3sl.ufpr.br/sabayon"                                 [Brazil 2]="http://sabayon.c3sl.ufpr.br"
  [Czech Republic 1]="ftp://mirror.dkm.cz/pub/sabayon"                            [Czech Republic 2]="http://sabayon.mirror.dkm.cz/pub/sabayon"
  [Germany 1]="http://mirror.de.sabayon.org"                                      [Denmark 1]="ftp://ftp.klid.dk/sabayonlinux/enttropy"
  [Denmark 2]="http://ftp.klid.dk/sabayonlinux"                                   [Greece 1]="ftp://ftp.cc.uoc.gr/mirrors/linux/SabayonLinux"
  [Greece 2]="http://ftp.cc.uoc.gr/mirrors/linux/SabayonLinux"                    [Hungary 1]="ftp://ftp.fsn.hu/pub/linux/distributions/sabayon"
  [Hungary 2]="http://ftp.fsn.hu/pub/linux/distributions/sabayon"                 [Italy 1]="http://mirror.it.sabayon.org"
  [Italy 2]="ftp://na.mirror.garr.it/mirrors/sabayonlinux"                        [Italy 3]="http://na.mirror.garr.it/mirrors/sabayonlinux"
  [Japan 1]="ftp://ftp.riken.jp/Linux/sabayon"                                    [Japan 2]="http://ftp.riken.jp/Linux/sabayon"
  [Japan 3]="ftp://ftp.kddilabs.jp/Linux/packages/sabayonlinux"                   [Japan 4]="http://ftp.kddilabs.jp/Linux/packages/sabayonlinux"
  [Japan 5]="http://ftp.tsukuba.wide.ad.jp/Linux/sabayon"                         [Netherlands 1]="ftp://ftp.nluug.nl/pub/os/Linux/distr/sabayonlinux"
  [Netherlands 2]="http://ftp.nluug.nl/os/Linux/distr/sabayonlinux"               [Netherlands 3]="ftp://ftp.surfnet.nl/pub/os/Linux/distr/sabayonlinux"
  [Portugal 1]="ftp://glua.ua.pt/sabayon"                                         [Portugal 2]="ftp://ftp.rnl.ist.utl.pt/pub/sabayon"
  [Portugal 3]="http://ftp.rnl.ist.utl.pt/pub/sabayon"                            [Russian Federation 1]="ftp://mirror.yandex.ru/sabayon"
  [Russian Federation 2]="http://mirror.yandex.ru/sabayon"                        [Sweden 1]="ftp://ftp.portlane.com/pub/os/linux/sabayon"
  [Sweden 2]="http://ftp.portlane.com/pub/os/linux/sabayon"                       [United States 1]="ftp://mirrors-usa.go-parts.com/sabayon"
  [United States 2]="http://mirrors-usa.go-parts.com/sabayon"                     [United States 3]="ftp://mirror.cs.vt.edu/pub/SabayonLinux"
  [United States 6]="http://mirror.clarkson.edu/sabayon"                          [United States 7]="http://mirror.umd.edu/sabayonlinux"
  [United States 4]="http://mirror.cs.vt.edu/pub/SabayonLinux"                    [United States 5]="http://cross-lfs.sabayonlinux.org"
  [South Africa 1]="ftp://sabayon.mirror.ac.za"                                   [South Africa 2]="http://sabayon.mirror.ac.za"
  )
  ## Unfortunately, associative arrays are not stored in the
  ## order you create them with so, to have the select show
  ## sorted options, we need a second, helper array.
  sorted=(
  [1]="Argentina 1"                            [2]="Argentina 2"                            [3]="Australia 1 FTP Internode"
  [4]="Australia 2 HTTP Internode"             [5]="Australia 3"                            [6]="Australia 4"
  [7]="Austria 1"                              [8]="Austria 2"                              [9]="Belgium 1"
  [10]="Belgium 2"                             [11]="Brazil 1"                              [12]="Brazil 2"
  [13]="Czech Republic 1"                      [14]="Czech Republic 2"                      [15]="Denmark 1"
  [16]="Denmark 2"                             [17]="Germany 1"                             [18]="Greece 1"
  [19]="Greece 2"                              [20]="Hungary 1"                             [21]="Hungary 2"
  [22]="Italy 1"                               [23]="Italy 2"                               [24]="Italy 3"
  [25]="Japan 1"                               [26]="Japan 2"                               [27]="Japan 3"
  [28]="Japan 4"                               [29]="Japan 5"                               [30]="Netherlands 1"
  [31]="Netherlands 2"                         [32]="Netherlands 3"                         [33]="Portugal 1"
  [34]="Portugal 2"                            [35]="Portugal 3"                            [36]="Russian Federation 1"
  [37]="Russian Federation 2"                  [38]="South Africa 1"                        [39]="South Africa 2"
  [40]="Sweden 1"                              [41]="Sweden 2"                              [42]="United States 1"
  [43]="United States 2"                       [44]="United States 3"                       [45]="United States 4"
  [46]="United States 5"                       [47]="United States 6"                       [48]="United States 7"
  )
  select x in "${sorted[@]}"
  do
      export MIRROR="${L[$x]}"
      break
  done
}

function sabayon-chrootn {
  if [[ $1 > 1 ]]
    then
      # Create a chroots directory, in which to store tarball releases of Gentoo/
      # Sabayon. This directory is NOT where the chroot will end up being
      mkdir $HOME/chroots
      # Enter the chroots directory
      pushd "$HOME/chroots"
        # Select a mirror from which to download the tarball.
        # These tarballs are usually >500 MB in size, so closer
        # the mirror, the better.
        wget -c $MIRROR/iso/daily/Sabayon_Linux_DAILY_amd64_tarball.tar.gz
        sudo mkdir /root$1
        sudo cp -a "Sabayon_Linux_DAILY_amd64_tarball.tar.gz" /root$1
        cd /root$1
        sudo tar xvzpf Sabayon_Linux_DAILY_amd64_tarball.tar.gz
        sudo mount -t proc none /root$1/proc
        sudo mount -o bind /dev /root$1/dev
        sudo mount -o bind /usr/portage /root$1/usr/portage
        sudo mount -o bind /usr/src/linux /root$1/usr/src/linux
        sudo mount -o bind /lib/modules /root$1/lib/modules
        sudo mount -o bind /sys /root$1/sys
        sudo cp /etc/resolv.conf /root$1/etc/resolv.conf
        sudo mount -o bind /tmp /root$1/tmp
        sudo mount --rbind /dev /root$1/dev
        sudo mount --rbind /sys /root$1/sys
      popd
  fi
}

alias schrootn=sabayon-chrootn

function schroot2 {
  sudo mount -t proc none /root2/proc
  sudo mount -o bind /dev /root2/dev
  sudo mount -o bind /usr/portage /root2/usr/portage
  sudo mount -o bind /usr/src/linux /root2/usr/src/linux
  sudo mount -o bind /lib/modules /root2/lib/modules
  sudo mount -o bind /sys /root2/sys
  sudo cp /etc/resolv.conf /root2/etc/resolv.conf
  sudo mount -o bind /tmp /root2/tmp
  sudo mount --rbind /dev /root2/dev
  sudo mount --rbind /sys /root2/sys
}

function cppack {
  sudo cp -a /root2/$1 $1
}
