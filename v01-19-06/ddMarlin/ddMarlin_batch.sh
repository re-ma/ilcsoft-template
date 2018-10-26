#!/bin/bash

make
DataDIR="$HOME/group-folder/"`pwd`"/data"
mkdir -p $DataDIR
ln -s $DataDIR data
ls -lt data

## param setting
#FNDIR="/home/ilc/reima/hybrid-ECAL/dd4hep/3rd_ILD_l5_v02/uds91/data"
FNDIR="/home/ilc/reima/hybrid-ECAL/dd4hep/3rd_ILD_l5_v02/gamma10GeV/data"
#FNPrefix="E1-calib.Puds91.Gsgreen.e0.p0.I110048."
FNPrefix="ILD_l5_v02_E1-calib.Ps_22_p010.Glcio_gun.e0.p0.I110141.n1.slcio"
EventPrefix=""
BName="g10"
BJob="s"

Num=0
#Num=1
EndNum=11

if [ "$Num" = "0" ]; then

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_dM \"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}.slcio ${EventPrefix}${FNPrefix} > logs/${EventPrefix}_ddMarlin.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_dM \
"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}.slcio ${EventPrefix}${FNPrefix} > logs/${EventPrefix}_ddMarlin.log 2>&1)"

else

while [ $Num -lt $EndNum ]; do

pNum=$(printf %02d $Num)

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_${pNum}dM \"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}${pNum}.slcio ${EventPrefix}${FNPrefix}${pNum} > logs/ddMarlin_${pNum}.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_${pNum}dM \
"(sh ddMarlin_run.sh ${FNDIR}/${FNPrefix}${pNum}.slcio ${EventPrefix}${FNPrefix}${pNum} > logs/ddMarlin_${pNum}.log 2>&1)"

Num=$(( Num + 1 ))

done

fi

