source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir RescaleEnergies

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/RescaleEnergies \
-i $1 \

###hepl
#Calibrate 
#    -i name   (mandatory, input file name(s), can include wildcards if string is in quotes)
#    -p        (optional, whether to plot results,      default 0)
#    -a value  (optional, ECalToEM calibration factor,  default 1)
#    -b value  (optional, HCalToEM calibration factor,  default 1)
#    -c value  (optional, ECalToHad calibration factor, default 1)
#    -d value  (optional, HCalToHad calibration factor, default 1)
#    -e value  (optional, Muon calibration factor,      default 1)

