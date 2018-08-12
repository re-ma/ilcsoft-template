#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v02-00-01/init_ilcsoft.sh

ddsim --inputFiles $1 \
--outputFile=$2 \
--numberOfEvents=$3 \
--compactFile $lcgeo_DIR/ILD/compact/ILD_l5_v02/ILD_l5_v02.xml \
--steeringFile=./ddsim_steer.py
