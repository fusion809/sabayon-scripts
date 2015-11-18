function root2 {
  sudo chroot /root2 /bin/bash
}

function chrootn {
  if [[ $1 > 1 ]]
    then
      sudo mkdir /root$1
      REL=20151112
      sudo cp -a stage3-amd64-$REL.tar.bz2 /root$1
      cd /root$1
      sudo tar xvjpf stage3-amd64-$REL.tar.bz2
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
      sudo mount --rbind /dev /root2/dev
      sudo mount --rbind /sys /root2/sys
  fi
}

function chrootb {
  sudo mount -t proc none /root2/proc
  sudo mount -o bind /dev /root2/dev
  sudo mount -o bind /usr/portage /root2/usr/portage
  sudo mount -o bind /usr/src/linux /root2/usr/src/linux
  sudo mount -o bind /lib/modules /root2/lib/modules
  sudo mount -o bind /sys /root2/sys
  sudo mount -o bind /tmp /root2/tmp
  sudo mount --rbind /dev /root2/dev
  sudo mount --rbind /sys /root2/sys
}
