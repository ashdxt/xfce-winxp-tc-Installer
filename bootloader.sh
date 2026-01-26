#!/usr/bin/env bash

#EXPERIMENTAL MIGHT SCREW UP BOOTLOADER
is_supported_distro=0

if [[ -r /etc/os-release ]]; then
  source /etc/os-release
  if [[ ("${ID:-}" == "ubuntu" && "${VERSION_ID:-}" == "24.04") || ("${ID:-}" == "linuxmint" && "${VERSION_ID:-}" == "22.3") ]]; then
    is_supported_distro=1
  fi
fi


if [[ $is_supported_distro ]]; then

  if [[ -r /etc/default/grub.d ]]; then
    sudo tee /etc/default/grub.d/80-winxptc.conf >/dev/null <<'EOF'
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
EOF
    #to do need to fix this to work without user input
    sudo update-alternatives --config default.plymouth 
    sudo update-initramfs -u
  fi
fi

