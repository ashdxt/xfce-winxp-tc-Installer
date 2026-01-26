#!/usr/bin/env bash

#EXPERIMENTAL MIGHT SCREW UP BOOTLOADER, problem with grub thinking of a way to fix it
is_supported_distro=0
CONST_THEME_LOCATION=/usr/share/plymouth/themes/bootvid/bootvid.plymouth
TRUE=1

if [[ -r /etc/os-release ]]; then
  source /etc/os-release
    if [[ ("${ID:-}" == "ubuntu" && "${VERSION_ID:-}" == "24.04") || ("${ID:-}" == "linuxmint" && "${VERSION_ID:-}" == "22.3") ]]; then
    is_supported_distro=1
  fi
fi


if [[ $is_supported_distro -eq $TRUE ]]; then

  if [[ -d /etc/default/grub.d ]]; then
    #need to do this better
    sudo tee /etc/default/grub.d/80-winxptc.conf >/dev/null <<'EOF'
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
EOF
    sudo update-grub
    #actually installs the plymouth theme and sets it
    sudo update-alternatives --install \
    /usr/share/plymouth/themes/default.plymouth default.plymouth \
    $CONST_THEME_LOCATION 150 
    sudo update-alternatives --set default.plymouth $CONST_THEME_LOCATION
    sudo update-initramfs -u
  fi
fi