#!/bin/bash
if [ $# != 1 ]
then
echo "Uso: tv <canal>"
else
if [ -z $1 ]
then
a=4
else
a=`expr $1`
a=`expr $a`
fi
aumix -l100
mplayer tv://$a -tv chanlist=us-cable:channels=1-01,2-02,3-03,4-04,5-05,6-06,7-07,8-08,9-09,10-10,
11-11,12-12,13-13:input=0:norm=NTSC:driver=v4l2:amode=1:
width=640:height=480:outfmt=yuy2:device=/dev/video0 -vf yadif,
eq=6:-3 -aspect 4:3 -ao alsa
fi
aumix -l0
