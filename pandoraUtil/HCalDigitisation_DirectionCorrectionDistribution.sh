source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir HCalDigitisation_DirectionCorrectionDistribution

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/HCalDigitisation_DirectionCorrectionDistribution \
-a $1 \
-b 20 \
-c HCalDigitisation_DirectionCorrectionDistribution/ \

###help
#Calibrate 
#    -a        (mandatory, input file name(s), can include wildcards if string is in quotes)   
#    -b value  (mandatory, true energy of kaonL being used for calibration)                    
#    -c        (mandatory, output path to send results to)                                     

