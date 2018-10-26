source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/init_ilcsoft.sh

mkdir PandoraPFACalibrate_SoftwareCompensation

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/PandoraPFACalibrate_SoftwareCompensation \
-d $1 \
-e 10:20:30:40:50:60 \
-f ./File_${energy}.root \
-t SoftwareCompensationTrainingTree \

###help
#PandoraPFA_SoftwareCompensation 
#    -d path      (mandatory, output path to send results to)                                                    
#    -e energies  (mandatory, input energies comma separated, i.e '10:20:30:40:50:60')                           
#    -f pattern   (mandatory, input file pattern. Should contains ${energy} key, i.e ./File_${energy}.root)      
#    -g           (if specified, the minimization will use the cluster energy instead of true energy (mc or beam))
#    -t treename  (mandatory, the tree name to look in root files, usually SoftwareCompensationTrainingTree)     

