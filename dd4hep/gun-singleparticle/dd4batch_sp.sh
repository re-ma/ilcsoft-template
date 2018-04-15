#!/bin/bash

ThisDIR="$HOME/group-folder/"`pwd`"/data"

echo "make $ThisDIR"
mkdir -p $ThisDIR

ln -s $ThisDIR data

mkdir logs

bsub -q s -o bsub.log -J mu-10_0_d4 \
"(sh dd4run_sp.sh data/mu-10_00.slcio > logs/mu-10_00.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_1_d4 \
"(sh dd4run_sp.sh data/mu-10_01.slcio > logs/mu-10_01.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_2_d4 \
"(sh dd4run_sp.sh data/mu-10_02.slcio > logs/mu-10_02.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_3_d4 \
"(sh dd4run_sp.sh data/mu-10_03.slcio > logs/mu-10_03.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_4_d4 \
"(sh dd4run_sp.sh data/mu-10_04.slcio > logs/mu-10_04.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_5_d4 \
"(sh dd4run_sp.sh data/mu-10_05.slcio > logs/mu-10_05.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_6_d4 \
"(sh dd4run_sp.sh data/mu-10_06.slcio > logs/mu-10_06.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_7_d4 \
"(sh dd4run_sp.sh data/mu-10_07.slcio > logs/mu-10_07.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_8_d4 \
"(sh dd4run_sp.sh data/mu-10_08.slcio > logs/mu-10_08.log 2>&1)"

bsub -q s -o bsub.log -J mu-10_9_d4 \
"(sh dd4run_sp.sh data/mu-10_09.slcio > logs/mu-10_09.log 2>&1)"
