#!/bin/bash

source /cvmfs/ilc.desy.de/sw/x86_64_gcc49_sl6/v01-19-04/init_ilcsoft.sh

ddsim --runType batch --steeringFile mysteer_ddsim.py -G 2>&1 | tee ddsim.log
