#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us,ru,ua
setxkbmap -option grp:win_space_toggle

xrandr --newmode "1920x1200_120.00"  410.50  1920 2080 2288 2656  1200 1203 1209 1289 -hsync +vsync
xrandr --addmode eDP-2 1920x1200_120.00
xrandr -s 1920x1200_120.00 -r 120

exec feh --bg-fill /home/TymurD/.wallpaper.jpg &
exec polybar &
exec picom --backend glx &
exec i3
