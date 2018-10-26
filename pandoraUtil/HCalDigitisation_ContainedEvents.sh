source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir HCalDigitisation_ContainedEvents

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/HCalDigitisation_ContainedEvents \
-a $1 \
-b 20 \
-d HCalDigitisation_ContainedEvents/Barrel_ \
-g Barrel \
-i 0 \
-j 1 \

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/HCalDigitisation_ContainedEvents \
-a $1 \
-b 20 \
-d HCalDigitisation_ContainedEvents/EndCap_ \
-g EndCap \
-i 0 \
-j 1 \

#-c \
#-e \

###help
#Calibrate 
#    -a        (mandatory, input file name(s), can include wildcards if string is in quotes)           
#    -b value  (mandatory, true energy of kaonL being used for calibration)                            
#    -c value  (optional, fractional accuracy to calibrate CalibrHCAL to, default 0.02)                
#    -d        (mandatory, output path to send results to)                                             
#    -e value  (optional, fit percentage used for calibration, default 90% of data with narrowest rms) 
#    -g        (mandatory, element of the detector being calibrated (Barrel or EndCap))                
#    -i value  (mandatory, lower abs cos theta cut defining element, default 0)                        
#    -j value  (mandatory, upper abs cos theta cut defining element, default 1)                        

