source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir SimCaloHitEnergyDistribution

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/SimCaloHitEnergyDistribution \
-a $1 \
-b 10 \
-c SimCaloHitEnergyDistribution/ \


###help
#Calibrate 
#    -a        (mandatory, input muon file name(s), can include wildcards if string is in quotes)  
#    -b value  (mandatory, true energy of muons being used for calibration)                        
#    -c value  (mandatory, output path to send results to)                                         

