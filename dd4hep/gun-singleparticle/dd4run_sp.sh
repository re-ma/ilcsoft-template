#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

ddsim --outputFile=$1 \
--numberOfEvents=3 \
--enableGun \
--gun.particle="mu-" \
--gun.energy="10*GeV" \
--gun.direction="(0, 1, 0)" \
--gun.distribution="uniform" \
--gun.thetaMin="0.71" \
--gun.thetaMax="2.43" \
--compactFile $lcgeo_DIR/ILD/compact/ILD_l5_v02/ILD_l5_v02.xml \
--steeringFile=./ddsim_steer.py
