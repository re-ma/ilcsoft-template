source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir PandoraPFACalibrate_HadronicEnergyGaussianFit

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/PandoraPFACalibrate_HadronicEnergyGaussianFit \
-a $1 \
-b 20 \
-d PandoraPFACalibrate_HadronicEnergyGaussianFit/ \
-f 48 \
-g 1 \

#-c \
#-e \



###help
#Calibrate 
#    -a        (mandatory, input file name(s), can include wildcards if string is in quotes)           
#    -b value  (mandatory, true energy of KaonL being used for calibration)                            
#    -c value  (optional, fractional accuracy to calibrate KaonL energy to, default 0.01)              
#    -d        (mandatory, output path to send results to)                                             
#    -e value  (optional, fit percentage used for calibration, default 90% of data with narrowest rms) 
#    -f value  (mandatory, number of HCal layers in simulation, default 48)                            
#    -g value  (mandatory, are non linearity corrections on, 1, or off, 0)                             

