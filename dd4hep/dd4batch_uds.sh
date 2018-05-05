#!/bin/bash

FNDIR="/hsm/ilc/grid/storm/prod/ilc/mc-dbd/generated/1-calib/uds"
FNPrefix="E1-calib.Puds91.Gsgreen.e0.p0.I110048."
FType="stdhep"
Event=100
BName="uds91"
BJob="l"

DataDIR="$HOME/group-folder/"`pwd`"/data"

echo "make $DataDIR"
mkdir -p $DataDIR

ln -s $DataDIR data

mkdir logs

Num=10

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_${Num}d4 \"(sh dd4run.sh ${FNDIR}/${FNPrefix}${Num}.${FType} data/${FNPrifix}${Num}.slcio ${Event} > logs/${FNPrefix}${Num}.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_${Num}d4 \
"(sh dd4run.sh ${FNDIR}/${FNPrefix}${Num}.${FType} data/${FNPrifix}${Num}.slcio ${Event} > logs/${FNPrefix}${Num}.log 2>&1)"

Num=1

while [ $Num -lt 10 ]; do

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_${Num}d4 \"(sh dd4run.sh ${FNDIR}/${FNPrefix}0${Num}.${FType} data/${FNPrifix}0${Num}.slcio ${Event} > logs/${FNPrefix}0${Num}.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_${Num}d4 \
"(sh dd4run.sh ${FNDIR}/${FNPrefix}0${Num}.${FType} data/${FNPrifix}0${Num}.slcio ${Event} > logs/${FNPrefix}0${Num}.log 2>&1)"

Num=$(( Num + 1 ))

done
