#!/bin/bash

ThisDIR="$HOME/group-folder/"`pwd`"/data"
FileName="mu-10"
ParticleName="mu-"
ParticleEnergy="10"
Event="3"
BJob="s"
EentPre="gen_"

echo "make $ThisDIR"
mkdir -p $ThisDIR

ln -s $ThisDIR data

mkdir logs

Num=0

while [ $Num -lt 1 ]; do

echo "bsub -q s -o bsub.log -J ${Name}_${Num}d4 \"(sh dd4run_gensp.sh ${ParticleName} ${ParticleEnergy} ${Event} data/${EventPre}${FileName}_${Num}.slcio > logs/${FileName}_${Num}.log 2>&1)\""

bsub -q s -o bsub.log -J ${Name}_${Num}d4 \
"(sh dd4run_gensp.sh ${ParticleName} ${ParticleEnergy} ${Event} data/${EventPre}${FileName}_${Num}.slcio > logs/${FileName}_${Num}.log 2>&1)"

Num=$(( Num + 1 ))

done
