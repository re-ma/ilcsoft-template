#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

FileFolder="data/"
FilePre="ddMarlin_Sc_REC_sc_wossaILD_l5_v02_E1-calib.Puds91.Gsgreen.e0.p0.I110048"
FilePre2="${FileFolder}${FilePre}"
InputFile="${FilePre2}.01.slcio ${FilePre2}.02.slcio ${FilePre2}.03.slcio ${FilePre2}.04.slcio ${FilePre2}.05.slcio ${FilePre2}.06.slcio ${FilePre2}.07.slcio ${FilePre2}.08.slcio ${FilePre2}.09.slcio ${FilePre2}.10.slcio"

FileFolder="data/"
FilePre="ddMarlin_Sc_REC_sc_wossaILD_l5_v02_E1-calib.Ps_22_p100.Glcio_gun.e0.p0.I110146.n1.slcio.slcio"
InputFile="${FileFolder}${FilePre}"

Marlin lctuple_Sc.xml \
--global.LCIOInputFiles="${InputFile}" \
--global.GearXMLFile=gear_ILD_l5_v02_dd4hep.xml \
--MyAIDAProcessor.FileName="data/lctuple_${FilePre}.root"

