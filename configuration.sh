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

#Cursor themes selectable under XFCE Settings > Mouse and Touchpad > Theme 
xfconf-query --create -c 'xsettings' -p '/Gtk/CursorThemeName' --type 'string' --set 'standard-no-shadow'

#SHELL SETUP

#TO DO auto startup services
#xfce4-panel --quit
#xfdesktop --quit


#TO DO greeter services config

xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/commands/custom/<Super>r' --type 'string' --set 'run'


xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/commands/custom/<Alt>F1' --type 'string' --set 'wintc-taskband --start'

sudo apt install -y xcape
xcape -e 'Super_L=Alt_L|F1'




