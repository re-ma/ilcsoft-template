#!/bin/bash

mkdir data
mkdir logs

bsub -q s -o bsub.log -J gamma10_0_d4 \
"(sh dd4run_sp.sh data/gamma10_00.slcio > logs/gamma10_00.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_1_d4 \
"(sh dd4run_sp.sh data/gamma10_01.slcio > logs/gamma10_01.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_2_d4 \
"(sh dd4run_sp.sh data/gamma10_02.slcio > logs/gamma10_02.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_3_d4 \
"(sh dd4run_sp.sh data/gamma10_03.slcio > logs/gamma10_03.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_4_d4 \
"(sh dd4run_sp.sh data/gamma10_04.slcio > logs/gamma10_04.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_5_d4 \
"(sh dd4run_sp.sh data/gamma10_05.slcio > logs/gamma10_05.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_6_d4 \
"(sh dd4run_sp.sh data/gamma10_06.slcio > logs/gamma10_06.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_7_d4 \
"(sh dd4run_sp.sh data/gamma10_07.slcio > logs/gamma10_07.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_8_d4 \
"(sh dd4run_sp.sh data/gamma10_08.slcio > logs/gamma10_08.log 2>&1)"

bsub -q s -o bsub.log -J gamma10_9_d4 \
"(sh dd4run_sp.sh data/gamma10_09.slcio > logs/gamma10_09.log 2>&1)"
