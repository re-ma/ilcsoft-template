#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v02-00-01/init_ilcsoft.sh

Marlin MarlinStdReco.xml \
--global.LCIOInputFiles=${1} \
--constant.DetectorModel="ILD_l5_v02" \
--constant.OutputBaseName=${2} \
--constant.lcgeo_DIR=$lcgeo_DIR \
--global.MaxRecordNumber=0 \
--global.OutputSteeringFile="MarlinStdRecoParsed_Sc.xml" 

###
# --global.OutputSteeringFile="MarlinStdRecoParsed_Si_default.xml" 
# --global.OutputSteeringFile="MarlinStdRecoParsed_Sc_woSSA.xml" 
