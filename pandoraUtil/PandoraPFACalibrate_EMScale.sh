source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir PandoraPFACalibrate_EMScale

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/PandoraPFACalibrate_EMScale \
-a $1 \
-b 10 \
-d PandoraPFACalibrate_EMScale/ \

#-c \
#-e \

###help
#Calibrate 
#    -a        (mandatory, input file name(s), can include wildcards if string is in quotes)           
#    -b value  (mandatory, true energy of photons being used for calibration)                          
#    -c value  (optional, fractional accuracy to calibrate CalibrECAL to, default 0.005)               
#    -d value  (mandatory, output path to send results to)                                             
#    -e value  (optional, fit percentage used for calibration, default 90% of data with narrowest rms) 

