#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

#convertToGear default $lcgeo_DIR/ILD/compact/ILD_l5_o1_v02/ILD_l5_o1_v02.xml gear_ILD_l5_o1_v02_dd4hep.xml

#DataDIR="/home/ilc/reima/hybrid-ECAL/dd4hep/3rd_ILD_l5_v02/uds91/data"

Marlin ddMarlin_Sc_woSSA.xml \
--global.LCIOInputFiles=${1} \
--global.MaxRecordNumber=1000 \
--global.GearXMLFile=gear_ILD_l5_v02_dd4hep.xml \
--InitDD4hep.DD4hepXMLFile=$lcgeo_DIR/ILD/compact/ILD_l5_v02/ILD_l5_v02.xml \
--MyLCIOOutputProcessor.LCIOOutputFile=data/ddMarlin_Sc_REC_${2}.slcio \
--DSTOutput.LCIOOutputFile=data/ddMarlin_Sc_DST_${2}.slcio \
--MyAIDAProcessor.FileName=data/ddMarlin_Sc_stdreco_${2} \
--MyPfoAnalysis.RootFile=data/PfoAnalysis_${2}.root \

#Marlin lctuple_Sc.xml \
#--global.GearXMLFile=gear_ILD_l5_o1_v02_dd4hep.xml

###Sample
#--global.LCIOInputFiles="" \
#--global.LCIOInputFiles=$DataDIR/${1} \
