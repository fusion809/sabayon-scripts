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
      sudo mount --rbind /sys /root$2/sys
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
  L=(
  'Argentina                         - ftp://mirrors.coopvgg.com.ar/sabayon'
  'Austria                           - ftp://gd.tuwien.ac.at/linux/sabayonlinux'
  'Australia (Optus, 2,000 MB/s)     - ftp://mirror.optusnet.com.au/sabayon'
  'Australia (Internode, 1,000 MB/s) - ftp://mirror.internode.on.net/pub/sabayon'
  'Belgium                           - ftp://ftp.belnet.be/mirror/sabayonlinux'
  'Brazil                            - ftp://sabayon.c3sl.ufpr.br/sabayon'
  'Czech Republic                    - ftp://mirror.dkm.cz/pub/sabayon'
  'Denmark                           - ftp://ftp.klid.dk/sabayonlinux'
  'Ecuador                           - ftp://mirror.uta.edu.ec/sabayon'
  'Germany (Official)                - http://mirror.de.sabayon.org'
  'Greece                            - ftp://ftp.cc.uoc.gr/mirrors/linux/SabayonLinux'
  'Italy (Garr Consortium)           - ftp://na.mirror.garr.it/mirrors/sabayonlinux'
  'Italy (TOP-IX Official Mirror)    - http://mirror.it.sabayon.org'
  'Japan (RIKEN, 10,000 MB/s)        - ftp://ftp.riken.jp/Linux/sabayon'
  'Netherlands                       - ftp://ftp.nluug.nl/pub/os/Linux/distr/sabayonlinux'
  'New Zealand                       - http://mirror.auckland.ac.nz/sabayon'
  'Portugal (Rede, 1,000 MB/s)       - ftp://ftp.rnl.tecnico.ulisboa.pt/pub/sabayon'
  'Russian Federation                - ftp://mirror.yandex.ru/sabayon'
  'South Africa                      - ftp://sabayon.mirror.ac.za'
  'Sweden                            - ftp://ftp.portlane.com/pub/os/linux/sabayon'
  'U.S.A (UMD, 10,000 MB/s)          - http://mirror.umd.edu/sabayonlinux'
  )
  select x in "${L[@]}"
  do
    export MIRROR="${x#*-}"
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
        # Select a mirror from which to download the tarball. I have chosen this
        # mirror as it is the best one available for Australian Sabayon users, like
        # myself. If you reside in another country, you should choose a mirror
        # closest to you! These tarballs are usually >500 MB in size, so closer
        # the mirror, the better.
        MIRROR=ftp://mirror.optusnet.com.au/sabayon
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
alias schroot2='sabayon-chrootn 2'
