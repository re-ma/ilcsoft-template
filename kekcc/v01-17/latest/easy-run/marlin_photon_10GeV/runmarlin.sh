#!/bin/bash
# run Marlin v01-16-02-p1

export MARLIN_DLL=   # Reset MARLIN_DLL.  Libraries define in MARLIN_DLL are loaded dynamically

softdir=/sw/ilc/ilcsoft
ilcsoftdir=${softdir}/cvmfs/x86_64_gcc44_sl6/v01-17-11
ildconfigdir=${softdir}/cvmfs/ILDConfig/v01-17-11-p02

. ${ilcsoftdir}/init_ilcsoft.sh

export MARLIN_DLL=${ROOTSYS}/lib/libTreePlayer.so:${ROOTSYS}/lib/libGui.so:${ROOTSYS}/lib/libGed.so:${MARLIN_DLL}

# Start Marlin here
Marlin MarlinPandoraValidation.xml > Marlin.log 2>&1

