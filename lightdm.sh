#!/usr/bin/env bash

if [ -d /etc/lightdm/lightdm.conf.d ]; then

    sudo tee /etc/lightdm/lightdm.conf.d/50-winxptc.conf >/dev/null <<'EOF'
[Seat:*]
greeter-session=wintc-logonui
EOF

fi

