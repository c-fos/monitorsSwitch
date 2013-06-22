#!/bin/bash
#===============================================================================
#
#          FILE: MonitorsSwitch.sh
#
#         USAGE: ./MonitorsSwitch.sh
#
#   DESCRIPTION:Simple ui for switch between monitors connected to notebook.
#   You should replace video output names (VGA1, LVDS1) to correct for your
#   case. This names you could inspect using xrandr util.
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Ilya Malakhin (pilat1988@gmail.com),
#  ORGANIZATION:
#       CREATED: 22.06.2013 13:11:43 NOVT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

MAIN_OUTPUT="LVDS1"
AUX_OUTPUT="VGA1"

ACTION=`dialog --stdout --menu "Monitors" 0 30 5 "Left" "Second monitor left-of main"\
 "Right" "Second monitor right-of main" "Main" "Only main monitir" "Second" "Only second monitor" "Same" \
"The same output on both monitors"`
if [ -n "${ACTION}" ];then
case $ACTION in
  Left)
	xrandr --output $AUX_OUTPUT --auto --left-of $MAIN_OUTPUT
	xrandr --output $MAIN_OUTPUT --auto
     ;;
  Right)
        xrandr --output $AUX_OUTPUT --auto --right-of $MAIN_OUTPUT
        xrandr --output $MAIN_OUTPUT --auto
     ;;
  Main)
	xrandr --output $AUX_OUTPUT --off
	xrandr --output $MAIN_OUTPUT --auto
     ;;
  Second)
  	xrandr --output $MAIN_OUTPUT --off
  	xrandr --output $AUX_OUTPUT --auto
     ;;
  Same)
    xrandr --output $AUX_OUTPUT --auto
    xrandr --output $MAIN_OUTPUT --auto
     ;;
esac
fi


