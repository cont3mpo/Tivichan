#!/bin/bash
if [ $1 = "-h" -o $1 = "--help" -o $1 = "-help" -o $1 = "help" -o $# -gt 3 ]
then
echo -e "Use: grabar [-h] | [channel [output_file [length] ]  ]"
exit
fi
if [ -z $1 ]
then
a=4
else
a=`expr $1`
a=`expr $a`
fi
aumix -l100
if [ $# = 3 ]
then
mencoder tv://$a -tv chanlist=us-cable:channels=1-01,2-02,3-03,4-04,5-05,6-06,7-07,8-08,9-09,10-10,
11-11,12-12,13-13:input=0:norm=NTSC:driver=v4l2:amode=1:width=640:
height=480:outfmt=yuy2:device=/dev/video0:buffersize=64:
audiorate=48000 -vf yadif,eq=6:-3,dsize=4/3 -oac mp3lame -lameopts cbr:br=128:mode=0 -ovc xvid -xvidencopts pass=1:zones=0,w,1.00:me_quality=1:vhq=0:min_iquant=1:
max_iquant=3:min_pquant=1:max_pquant=3:min_bquant=1:
max_bquant=3:max_key_interval=5:quant_type=mpeg:
frame_drop_ratio=0:rc_reaction_delay_factor=16:rc_averaging_period=100:
profile=asp5 -o $2 -endpos $3
elif [ $# = 2 ]
then
mencoder tv://$a -tv chanlist=us-cable:channels=1-01,2-02,3-03,4-04,5-05,6-06,7-07,8-08,9-09,10-10,11-11,
12-12,13-13:input=0:norm=NTSC:driver=v4l2:amode=1:width=640:
height=480:outfmt=yuy2:device=/dev/video0:buffersize=64:audiorate=48000 
-vf yadif,eq=6:-3,dsize=4/3 -oac mp3lame -lameopts cbr:br=128:mode=0 
-ovc xvid -xvidencopts pass=1:zones=0,w,1.00:me_quality=1:vhq=0:min_iquant=1:max_iquant=3:
min_pquant=1:max_pquant=3:min_bquant=1:max_bquant=3:
max_key_interval=5:quant_type=mpeg:frame_drop_ratio=0:
rc_reaction_delay_factor=16:rc_averaging_period=100:profile=asp5 -o $2
elif [ $# = 1 ]
then
mencoder tv://$a -tv chanlist=us-cable:channels=1-01,2-02,3-03,4-04,5-05,6-06,7-07,8-08,9-09,10-10,11-11,
12-12,13-13:input=0:norm=NTSC:driver=v4l2:amode=1:width=640:
height=480:outfmt=yuy2:device=/dev/video0:buffersize=64:audiorate=48000 
-vf yadif,eq=6:-3,dsize=4/3 -oac mp3lame -lameopts cbr:br=128:mode=0 
-ovc xvid -xvidencopts pass=1:zones=0,w,1.00:me_quality=1:vhq=0:min_iquant=1:max_iquant=3:
min_pquant=1:max_pquant=3:min_bquant=1:max_bquant=3:
max_key_interval=5:quant_type=mpeg:frame_drop_ratio=0:
rc_reaction_delay_factor=16:rc_averaging_period=100:profile=asp5 -o `date +%H%M%S`.avi
fi
if [ -e divx2pass.log ]
then
rm divx2pass.log
fi
aumix -l0
