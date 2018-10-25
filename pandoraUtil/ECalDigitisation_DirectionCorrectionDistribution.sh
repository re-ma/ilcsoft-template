source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir ECalDigitisation_DirectionCorrectionDistribution

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/ECalDigitisation_DirectionCorrectionDistribution \
-a $1 \
-b 10 \
-c ECalDigitisation_DirectionCorrectionDistribution/ \

### help
#Calibrate 
#    -a        (mandatory, input file name(s), can include wildcards if string is in quotes)   
#    -b value  (mandatory, true energy of photon being used for calibration)                    
#    -c        (mandatory, output path to send results to)                                     

