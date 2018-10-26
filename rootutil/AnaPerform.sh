#!/bin/bash

#rm AIDA_all.root

#rm Results.dat

#. /home/ilc/reima/kankyosettei/rootpath.sh

#sh AIDA_merger.sh

/cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-06/PandoraAnalysis/v02-00-00/bin/AnalysePerformance $1 > Results.dat

cat Results.dat
