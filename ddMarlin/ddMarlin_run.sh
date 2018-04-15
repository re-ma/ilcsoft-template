#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

DataDIR="/home/ilc/reima/hybrid-ECAL/dd4hep/ILD_l5_v02/mu-10GeV/data/"

Marlin ddMarlin_Sc.xml \
--global.LCIOInputFiles="$DataDIR/mu-10_00.slcio $DataDIR/mu-10_01.slcio $DataDIR/mu-10_02.slcio $DataDIR/mu-10_03.slcio $DataDIR/mu-10_04.slcio $DataDIR/mu-10_05.slcio $DataDIR/mu-10_06.slcio $DataDIR/mu-10_07.slcio $DataDIR/mu-10_08.slcio $DataDIR/mu-10_09.slcio" \
--global.GearXMLFile=gear_ILD_l5_v02_dd4hep.xml \
--InitDD4hep.DD4hepXMLFile=$lcgeo_DIR/ILD/compact/ILD_l5_v02/ILD_l5_v02.xml

Marlin lctuple_Sc.xml \
--global.GearXMLFile=gear_ILD_l5_v02_dd4hep.xml

###Sample
#--global.LCIOInputFiles="" \
