#!/bin/bash

DataDIR="$HOME/group-folder/"`pwd`"/data"

if [ -e data ]; then

else;
    mkdir -p $DataDIR
    ln -s $DataDIR data
    ls -lt data
fi

mkdir logs

ILDConfig_DIR="/cvmfs/ilc.desy.de/sw/ILDConfig/v01-19-06-p01/StandardConfig/lcgeo_current/"

cp $ILDConfig_DIR/LikelihoodPID_* .
cp $ILDConfig_DIR/PandoraLikelihoodData* .
cp $ILDConfig_DIR/PandoraSettings* .
cp -r $ILDConfig_DIR/weightFiles_forLowMomentumMuPiSeparation .

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

#convertToGear default $lcgeo_DIR/ILD/compact/ILD_l5_o1_v02/ILD_l5_o1_v02.xml gear_ILD_l5_o1_v02_dd4hep.xml
convertToGear default $lcgeo_DIR/ILD/compact/ILD_l5_v02/ILD_l5_v02.xml gear_ILD_l5_v02_dd4hep.xml

#!/bin/bash

