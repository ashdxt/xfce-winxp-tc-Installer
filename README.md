# xfce-winxp-tc-Installer

aim to create a 1 click installer for https://github.com/rozniak/xfce-winxp-tc to turn it from a 30 minute process into a click and done thing.


TLDR How do I use this to install winxp-tc
run the following in your terminal after downloading the shell scripts
chmod +x configuration.sh winxp_installer.sh
./winxp_installer.sh; ./configuration.sh


work in progress


#TO DO test bootloader configuration

#TO DO change wallpaper



Progress:
compiling from source ✅ (all done)

UI theme ✅ (all done)

    GTK themes selectable under XFCE Settings > Appearance > Style
    Icon theme selectable under XFCE Settings > Appearance > Icons
    Change UI fonts under XFCE Settings > Appearance > Fonts
        Default Font: Tahoma Regular 8
        Hinting: Full
        I do recommend enabling anti-aliasing, mainly because web fonts look horrific otherwise!
    Window borders (decorations) selectable under XFCE Settings > Window Manager > Style
        For Windows XP style variants, use Title font: Trebuchet MS Bold 10
        For Professional or Windows Classic variants, use Title font: Tahoma Bold 8
        Title alignment: Left
        Rearrange button layout to Menu | Title | Min | Max | Close
    Disable window shadows under XFCE Settings > Window Manager Tweaks > Compositor
        Uncheck Show shadows under popup windows
        Uncheck Show shadows under dock windows
        Uncheck Show shadows under regular windows
    Cursor themes selectable under XFCE Settings > Mouse and Touchpad > Theme

Shell setup ✅  (all done)

    Close XFCE's panel and desktop¬ ✅
        Open a terminal
        xfce4-panel --quit
        xfdesktop --quit
    Add shell programs to session startup under XFCE Settings > Session and Startup > Application Autostart
        Add new¬✅ 
            Name: WinTC Desktop (up to you)
            Command: wintc-desktop
        Add new¬✅ 
            Name: WinTC Taskband (up to you) 
            Command: wintc-taskband
    Replace Win+R shortcut under XFCE Settings > Keyboard > Application Shortcuts✅
        Add run
        Win+R for the combo
        Say Yes to accept replacing the built-in XFCE launcher
    Set up Windows key to open the Start menu under XFCE Settings > Keyboard > Application Shortcuts✅
        Add wintc-taskband --start
        Alt+F1 for the combo
        Say Yes to accept replacing the built-in XFCE launcher
        Install xcape on your distro
        Run xcape -e 'Super_L=Alt_L|F1' (doing it this way means the Windows key activates on release, otherwise it would block your ability to do Win+R)

Sound theme ✅ 

    Sound theme configurable under XFCE Settings > Settings Editor > xsettings
        Check EnableEventSounds
        Check EnableInputFeedbackSounds
        SoundThemeName set to Windows XP Default

Logon screen (Greeter) ✅

This varies by distro, so you may want to Google if you're stuck.

This project supplies a LightDM Greeter called wintc-logonui

    Edit /etc/lightdm/lightdm.conf
    Find the greeter-session= line (it may be commented out)
    Replace it or add greeter-session=wintc-logonui

You can either restart LightDM now with sudo systemctl restart lightdm (will kick you out of your session), or it'll apply on next boot.
Boot splash

This also varies by distro, especially if you're on FreeBSD (see end of this section). ❌

This project supplies a Plymouth Theme called bootvid

    Edit /etc/default/grub
        Add splash to GRUB_CMDLINE_LINUX_DEFAULT
        Eg. GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
    Run sudo plymouth-set-default-theme -R bootvid
        Important you specify -R as this will rebuild initrd
    Run sudo update-grub

FreeBSD Users: Plymouth is not present, I am not familiar with it really but there is a 'splash' module supposedly capable of displaying a bitmap. This project provides /usr/local/res/bootvid.bmp - unfortunately I have not configured this before so currently you are on your own. If anyone gets it working I would be happy to add instructions here.
