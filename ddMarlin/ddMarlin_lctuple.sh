#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v02-00-01/init_ilcsoft.sh

FilePre="ddMarlin_Sc_REC_E1-calib.Puds91.Gsgreen.e0.p0.I110048"
InputFile=${1}
#InputFile="${FilePre}.01.slcio ${FilePre}.02.slcio ${FilePre}.03.slcio ${FilePre}.04.slcio ${FilePre}.05.slcio ${FilePre}.06.slcio ${FilePre}.07.slcio ${FilePre}.08.slcio ${FilePre}.09.slcio"

Marlin MarlinStdRecoLCTuple.xml \
--MyAIDAProcessor.FileName=${FilePre} \
--global.LCIOInputFiles=${InputFile}
