#!/bin/bash

ThisDIR="$HOME/group-folder/"`pwd`"/data"

echo "make $ThisDIR"
mkdir -p $ThisDIR

ln -s $ThisDIR data

mkdir logs

bsub -q s -o bsub.log -J uds910_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_00.stdhep data/uds91_00.slcio > logs/uds91_00.log 2>&1)"

bsub -q s -o bsub.log -J uds911_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_01.stdhep data/uds91_01.slcio > logs/uds91_01.log 2>&1)"

bsub -q s -o bsub.log -J uds912_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_02.stdhep data/uds91_02.slcio > logs/uds91_02.log 2>&1)"

bsub -q s -o bsub.log -J uds913_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_03.stdhep data/uds91_03.slcio > logs/uds91_03.log 2>&1)"

bsub -q s -o bsub.log -J uds914_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_04.stdhep data/uds91_04.slcio > logs/uds91_04.log 2>&1)"

bsub -q s -o bsub.log -J uds915_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_05.stdhep data/uds91_05.slcio > logs/uds91_05.log 2>&1)"

bsub -q s -o bsub.log -J uds916_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_06.stdhep data/uds91_06.slcio > logs/uds91_06.log 2>&1)"

bsub -q s -o bsub.log -J uds917_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_07.stdhep data/uds91_07.slcio > logs/uds91_07.log 2>&1)"

bsub -q s -o bsub.log -J uds918_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_08.stdhep data/uds91_08.slcio > logs/uds91_08.log 2>&1)"

bsub -q s -o bsub.log -J uds919_d4 \
"(sh dd4run.sh /group/ilc/soft/samples/gen/MThomson/stdhep/uds91_09.stdhep data/uds91_09.slcio > logs/uds91_09.log 2>&1)"
