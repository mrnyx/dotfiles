#!/bin/bash

#xrdb -merge .Xresources

#(sleep 2s && trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --height 12 --transparent true --alpha 0 --tint 0x000000) &

gnome-screensaver &

gnome-settings-daemon &

if [ -x /usr/bin/nm-applet ] ; then
    nm-applet --sm-disable &
    #ck-launch-session nm-applet --sm-disable &
fi

# notification deamon (really annoying on gnome3)
#/usr/lib/notification-daemon/notification-daemon &

# policy kit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

update-notifier &

workrave & 

numlockx &

#if [ -x /usr/bin/wicd-client ] ; then
#   wicd-client &
#fi

#feh --bg-fill /path/to/wallpaper.jpg &

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --height 18 --transparent true --alpha 0 --tint 0x000000 &

exec xmonad
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
#exec ck-launch-session dbus-launch xmonad
