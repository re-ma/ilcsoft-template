#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir logs
mkdir data

convertToGear default $lcgeo_DIR/ILD/compact/ILD_l5_v02/ILD_l5_v02.xml gear_ILD_l5_v02_dd4hep.xml

bsub -q s -o bsub.log -J ddm_mu-10 \
"(sh ddMarlin_run.sh > logs/ddMarlin.log 2>&1)"
