#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

ddsim --inputFiles $1 \
--outputFile=$2 \
--numberOfEvents=3 \
--compactFile $lcgeo_DIR/ILD/compact/ILD_l5_o1_v02/ILD_l5_o1_v02.xml \
--steeringFile=./ddsim_steer.py
