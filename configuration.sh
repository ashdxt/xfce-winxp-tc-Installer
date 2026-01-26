#!/usr/bin/env bash

#manual installation

#UI THEME 

#GTK themes selectable under XFCE Settings > Appearance > Style 
xfconf-query -c xsettings -p /Net/ThemeName -s "Windows XP style (Blue)"

xfconf-query -c xfwm4 -p /general/theme -s "Windows XP style (Blue)"

#Icon theme selectable under XFCE Settings > Appearance > Icons 
xfconf-query --create -c 'xsettings' -p '/Net/IconThemeName' --type 'string' --set 'luna'

#Change UI fonts under XFCE Settings > Appearance > Fonts
xfconf-query --create -c 'xsettings' -p '/Gtk/FontName' --type 'string' --set 'Tahoma 8'

#For Windows XP style variants, use Title font: Trebuchet MS Bold 10 
xfconf-query --create -c 'xfwm4' -p '/general/title_font' --type 'string' --set 'Trebuchet MS Bold 10'

xfconf-query --create -c 'xfwm4' -p '/general/title_alignment' --type 'string' --set 'left'

#Rearrange button layout to Menu | Title | Min | Max | Close 
xfconf-query --create -c 'xsettings' -p '/Gtk/DecorationLayout' --type 'string' --set 'menu:minimize,maximize,close'
xfconf-query --create -c 'xfwm4' -p '/general/button_layout' --type 'string' --set 'O|HMC'

#Disable window shadows under XFCE Settings > Window Manager Tweaks > Compositor 
xfconf-query --create -c 'xfwm4' -p '/general/show_popup_shadow' --type 'bool' --set 'false'
xfconf-query --create -c 'xfwm4' -p '/general/show_dock_shadow' --type 'bool' --set 'false'
xfconf-query --create -c 'xfwm4' -p '/general/show_frame_shadow' --type 'bool' --set 'false'

#edits Cursor themes selectable under XFCE Settings > Mouse and Touchpad > Theme 
xfconf-query --create -c 'xsettings' -p '/Gtk/CursorThemeName' --type 'string' --set 'standard-no-shadow'

#SHELL SETUP

#autostartup services
xfce4-panel --quit
xfdesktop --quit

#makes sure there is an actual autostart directory
mkdir -p ~/.config/autostart

#sets the wintc desktop and wintc taskband as autostart services

cat > ~/.config/autostart/wintc-desktop.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=WinTC Desktop
Exec=wintc-desktop
OnlyShowIn=XFCE;
Terminal=false
StartupNotify=false
EOF

cat > ~/.config/autostart/wintc-taskband.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=WinTC Taskband
Exec=wintc-taskband
OnlyShowIn=XFCE;
Terminal=false
StartupNotify=false
EOF


#sets wintc-logonui as the greeter service (uses a drop in config file) 
#see documentation here https://github.com/canonical/lightdm 
if [ -d /etc/lightdm/lightdm.conf.d ]; then

    sudo tee /etc/lightdm/lightdm.conf.d/50-winxptc.conf >/dev/null <<'EOF'
[Seat:*]
greeter-session=wintc-logonui
EOF

fi


#keyboard shortcut
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/commands/custom/<Super>r' --type 'string' --set 'run'


xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/commands/custom/<Alt>F1' --type 'string' --set 'wintc-taskband --start'

sudo apt install -y xcape
xcape -e 'Super_L=Alt_L|F1'

#Sound theme configurable under XFCE Settings > Settings Editor > xsettings 
xfconf-query -c xsettings -p /Net/EnableEventSounds -n -t bool -s true 
xfconf-query -c xsettings -p /Net/EnableInputFeedbackSounds -n -t bool -s true

xfconf-query -c xsettings -p /Net/SoundThemeName -n -t string -s "Windows XP Default"




