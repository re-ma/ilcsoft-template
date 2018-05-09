#!/bin/bash

mkdir logs
mkdir data

ILDConfig_DIR="/cvmfs/ilc.desy.de/sw/ILDConfig/v01-19-06-p01/StandardConfig/lcgeo_current/"

cp $ILDConfig_DIR/LikelihoodPID_* .
cp $ILDConfig_DIR/PandoraLikelihoodData* .
cp $ILDConfig_DIR/PandoraSettings* .
cp -r $ILDConfig_DIR/weightFiles_forLowMomentumMuPiSeparation .

bsub -q s -o bsub.log -J ddM_mu-10 \
"(sh ddMarlin_run.sh > logs/ddMarlin.log 2>&1)"
