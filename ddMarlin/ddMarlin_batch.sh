#!/bin/bash

## param setting
#FNDIR="/home/ilc/reima/hybrid-ECAL/dd4hep/3rd_ILD_l5_v02/uds91/data"
FNDIR="/home/ilc/reima/hybrid-ECAL/dd4hep/v02-00-01/3rd_ILD_l5_v02/mu-10GeV/data"
#FNPrefix="E1-calib.Puds91.Gsgreen.e0.p0.I110048."
FNPrefix="ILD_l5_v02_E1-calib.Ps_pm13_p100_t20.Glcio_gun.e0.p0.I110119.n1.slcio"
EventPrefix="test-"
BName="mu-10"
BJob="s"

Num=0 #0 for single file
#Num=1 #1 for 2 or more files, if you have 2 or more files, remove comennt out
EndNum=11

## Start this script
if [ -e data ]; then
    echo "OK, data directory is exist"
else
    echo "data directory is NOT found"
    echo 'please run "sh ddMarlin_pre.sh"'
    exit 1
fi

if [ -e logs ]; then
    echo "OK, logs directory is exist"
else
    echo "logs directory is NOT found"
    echo 'please run "sh ddMarlin_pre.sh"'
    exit 1
fi


if [ "$Num" = "0" ]; then

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_M \"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}.slcio ${EventPrefix}${FNPrefix} > logs/${EventPrefix}_ddMarlin.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_M \
"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}.slcio ${EventPrefix}${FNPrefix} > logs/${EventPrefix}_ddMarlin.log 2>&1)"

else

while [ $Num -lt $EndNum ]; do

pNum=$(printf %02d $Num)

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_${pNum}M \"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}${pNum}.slcio ${EventPrefix}${FNPrefix}${pNum} > logs/ddMarlin_${pNum}.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_${pNum}M \
"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}${pNum}.slcio ${EventPrefix}${FNPrefix}${pNum} > logs/ddMarlin_${pNum}.log 2>&1)"

Num=$(( Num + 1 ))

done

fi

