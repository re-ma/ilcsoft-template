#!/bin/bash

DataDIR="$HOME/group-folder/"`pwd`"/data"

if [ -e data ]; then
    echo "OK, data directory is exist"
else;
    mkdir -p $DataDIR
    ln -s $DataDIR data
    ls -lt data
    echo "make data directory"
fi

if [ -e logs ]; then
    echo "OK, data directory is exist"
else;
    mkdir logs
    echo "make logs directory"
fi

ILDConfig_DIR="/cvmfs/ilc.desy.de/sw/ILDConfig/v02-00-01/StandardConfig/production"

cp $ILDConfig_DIR/MarlinStdReco.xml
cp -r $ILDConfig_DIR/Config .
cp -r $ILDConfig_DIR/HighLevelReco .
cp -r $ILDConfig_DIR/PandoraSettings .
cp -r $ILDConfig_DIR/ParticleFlow .
cp -r $ILDConfig_DIR/Tracking .
cp $ILDConfig_DIR/MarlinStdRecoLCTuple.xml
