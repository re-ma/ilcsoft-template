source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir PandoraPFACalibrate_MipResponse

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/PandoraPFACalibrate_MipResponse \
-a $1 \
-b 10 \
-c PandoraPFACalibrate_MipResponse/ \


###help
#Calibrate 
#    -a        (mandatory, input file name(s), can include wildcards if string is in quotes)   
#    -b value  (mandatory, true energy of muons being used for calibration)                    
#    -c value  (mandatory, output path to send results to)                                     

