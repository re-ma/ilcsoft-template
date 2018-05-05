#!/bin/bash

FNDIR="/hsm/ilc/grid/storm/prod/ilc/mc-dbd/generated/1-calib/single"
FNPrefix="E1-calib.Ps_22_p010.Glcio_gun.e0.p0.I110141.n1.slcio"
Event="10000"
BName="g10GeV"
BJob="s"

DataDIR="$HOME/group-folder/"`pwd`"/data"

echo "make $DataDIR"
mkdir -p $DataDIR

ln -s $DataDIR data

mkdir logs

echo "bsub -q ${BJob} -o bsub.log -J ${BName}_d4 \"(sh dd4run.sh ${FNDIR}/${FNPrefix} data/${FNPrifix}.slcio ${Event} > logs/${FNPrefix}.log 2>&1)\""

bsub -q ${BJob} -o bsub.log -J ${BName}_d4 \
"(sh dd4run.sh ${FNDIR}/${FNPrefix} data/${FNPrifix}.slcio ${Event} > logs/${FNPrefix}.log 2>&1)"
