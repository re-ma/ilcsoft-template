#!/bin/bash

FNDIR="/hsm/ilc/grid/storm/prod/ilc/mc-dbd/generated/1-calib/uds"
FNPrefix="E1-calib.Puds91.Gsgreen.e0.p0.I110048."
EventPre="ILD_l5_v02_"
FType="stdhep"
Event="1000"
BName="uds91"
BJob="l"

DataDIR="$HOME/group-folder/"`pwd`"/data"

echo "make $DataDIR"
mkdir -p $DataDIR

ln -s $DataDIR data

mkdir logs

Num=1

while [ $Num -lt 11 ]; do

pNum=$(printf %02d $Num)

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_${pNum}d4 \"(sh dd4run.sh ${FNDIR}/${FNPrefix}${pNum}.${FType} data/${EventPre}${FNPrefix}${pNum}.slcio ${Event} > logs/${EventPre}${FNPrefix}${pNum}.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_${pNum}d4 \
"(sh dd4run.sh ${FNDIR}/${FNPrefix}${pNum}.${FType} data/${EventPre}${FNPrefix}${pNum}.slcio ${Event} > logs/${EventPre}${FNPrefix}${pNum}.log 2>&1)"

Num=$(( Num + 1 ))

done
