#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys
import random

###
### this script prepare mokka run. version for v01-17-11
###

### user setting parameter
# Batch_Num is batch jobs number
# Beamon_g4 is event number of 1 mokka run
# So Batch_Num * Beamon_g4 is full events
# Stdhepon_g4 is select use stdhep file or g4gun
# If you want use stdhep file, it's parameter true
# If you want use g4gun, it's parameter false
Batch_NUM = 1
Beamon_g4 = '1000'
Stdhepon_g4 = True #Ture or False
ILDdetectorModel_Steer = 'ILD_o1_v05' ## ILD_o1_v05;for Si+AHCAL, ILD_o2_v05;for Si+SDHCAL, ILD_o3_v05;for ScSiMix+AHCAL, 

### stdhep file
Stdhepdir_g4 = '/group/ilc/soft/samples/gen/MThomson/stdhep/'
Stdhepfile_g4 = 'uds91_00.stdhep'
### stdhep file's 00 replase Batch_NUM
### if you want many stdhep file, it's must name file *00*.stdhep

### gun perticle
### Particle and enegry Unit refer to this url
### http://geant4.cern.ch/UserDocumentation/UsersGuides/ForApplicationDeveloper/html/AllResources/Control/UIcommands/_gun_.html
Particle_g4 = 'gamma'
EnegyValue_g4 = '10'
EnegyUnit_g4 = 'GeV'

### end user setting parameter

### enviroment setting
DIR_ILCSOFT = '/sw/ilc/ilcsoft/cvmfs/x86_64_gcc44_sl6/v01-17-11'
DIR_ILDCONFIG = '/sw/ilc/ilcsoft/cvmfs/ILDConfig/v01-17-11-p02'
Name_Bsub = 'bsub.sh'
Name_Shellscript = 'mokka.sh'
Name_g4macro = '.g4'
Name_Steer = '.steer'
Batch_que = 's'

### def file make function
def File_Make(File_Name, File_Data):
	File_Wirte = open(File_Name,'w')
	File_Wirte.write(File_Data)
	print 'make ' + File_Name

### replace 00 at stdhep file
if Stdhepon_g4:
	StdhepName_g4 = Stdhepfile_g4.replace('.stdhep', '')

### make FileName
FileName_Bsub = Name_Bsub
FileName_Shellscript = Name_Shellscript
if Stdhepon_g4:
	FileName_g4macro = StdhepName_g4 + Name_g4macro
else:
	FileName_g4macro = Particle_g4 +  '_' + EnegyValue_g4 + EnegyUnit_g4 + Name_g4macro
if Stdhepon_g4:	
	FileName_Steer = StdhepName_g4 + Name_Steer
else:
	FileName_Steer = Particle_g4 +  '_' + EnegyValue_g4 + EnegyUnit_g4 + '_00' + Name_Steer
	

### make bsub shellscript data
Data_Bsub ='#!/bin/bash\n'

for Num_Bsub in range(Batch_NUM):
	Data_Bsub += 'bsub ' + '-q '  + Batch_que + ' '
	Data_Bsub += '-o runmokka' + str(Num_Bsub) + '.log '
	Data_Bsub +=  '-J runmokka' + str(Num_Bsub) + ' '
	Data_Bsub +=  '"(./mokka.sh ' + str(Num_Bsub).zfill(2) + ' > mokka' + str(Num_Bsub).zfill(2) + '.log 2>&1 )" &\n'

File_Make(Name_Bsub, Data_Bsub)

### make Mokka shellscript data
Data_Shellscript = '''#!/bin/bash
# this file for Mokka run \n

'''

Env_ilcsoft_Shellscript = 'source ' + DIR_ILCSOFT + '/init_ilcsoft' + '\n'
Data_Shellscript += Env_ilcsoft_Shellscript

Env_ildconfig_Shellscript = 'MokkaDBConfig=' + DIR_ILDCONFIG + '/MokkaDBConfig' + '\n'
Env_ildconfig_Shellscript += '''export MOKKA_DUMP_FILE=${MokkaDBConfig}/mokka-dbdump.sql.tgz
export MOKKA_TMP_DIR=/tmp/mokka-$(date +%F--%H-%M-%S)-$$
mkdir -p ${MOKKA_TMP_DIR}
export MSG_LOG_FILE=`pwd`/mokka-run${$1}.log
StandardConfig=${ildconfigdir}/StandardConfig/current
'''

Data_Shellscript += Env_ildconfig_Shellscript

Data_Shellscript +='''
ln -sf ${StandardConfig}/particle.tbl .

# Start Mokka here
'''

DataNum_ShellScript = Data_Shellscript + '${MokkaDBConfig}/scripts/mokka-wrapper.sh ' + FileName_Steer.replace('00', '${1}')
File_Make(FileName_Shellscript, DataNum_ShellScript)

### make g4macro data

Data1_g4macro = '''/run/verbose 0
/event/verbose 0
/tracking/verbose 0

'''

Data2_g4macro='''
/Mokka/Draw 1
/step/draw 1
'''

Data2_g4macro += '/run/beamOn ' + Beamon_g4 + '\n'
Data2_g4macro += '''exit'''

if Stdhepon_g4:
	for Num_g4 in range(Batch_NUM):
		StdhepName_g4macro = StdhepName_g4.replace('00', str(Num_g4).zfill(2)) + Name_g4macro
		Data_g4macro = Data1_g4macro
		Data_g4macro += '/generator/generator '
		Data_g4macro += Stdhepdir_g4
		Data_g4macro += Stdhepfile_g4.replace('00', str(Num_g4).zfill(2)) + '\n'
		Data_g4macro += Data2_g4macro
		File_Make(StdhepName_g4macro, Data_g4macro)
else:
	Name_g4macro = Particle_g4 +  '_' + EnegyValue_g4 + EnegyUnit_g4 + Name_g4macro
	Data_g4macro = Data1_g4macro
	Data_g4macro += '/gun/momentum ' + EnegyValue_g4 + ' ' + EnegyUnit_g4 + '\n'
	Data_g4macro += '''/gun/positionStep 0 0 0 mm
/gun/thetaStep 0
/gun/thetaSmearing 0.25
/gun/phiStep 0
/gun/phiSmearing 360
/gun/direction 0.9979998 0 0.02
/gun/position 0 0 0 mm
'''
	Data_g4macro += '/gun/particle ' + Particle_g4 + '\n'
	Data_g4macro += Data2_g4macro
	File_Make(Name_g4macro, Data_g4macro)

### make steerging file data
Data1_Steer = '''##########################
#
#
# fg:  for now this only works with this development detector model
#      with simplified SIT, SET, FTD and ETD removed
#      -> to be fixed
#
#/Mokka/init/detectorModel ILD_01_dev
#  -> use -M ILD_ox_v05 , x=1,2,3
####################################

/Mokka/init/lcioFilename ../data/uds91.slcio

#/Mokka/init/registerPlugin TrackingOnlyPlugin

# -----FIXME: need to get the correct number for the vertex spread
#             300 mu is the bunch length...
#             so assume convolution of two gaussians
#/Mokka/init/primaryVertexSpreadZ 0.424264 mm
'''
Data1_Steer += '/Mokka/init/detectorModel ' + ILDdetectorModel_Steer + '\n'
Data1_Steer += '''/Mokka/init/MokkaGearFileName data/gear.xml

/Mokka/init/lcioWriteMode WRITE_NEW
/Mokka/init/lorentzTransformationAngle 7 mrad

/Mokka/init/BFactor 1.0
/Mokka/init/userDeltaIntersection 1e-5 mm
/Mokka/init/userDeltaOneStep 1e-4 mm
/Mokka/init/lcioDetailedShowerMode false
/Mokka/init/lcioWriteCompleteHepEvt true

/Mokka/init/lcioDetailedTRKHitMode SETCollection
/Mokka/init/lcioDetailedTRKHitMode SITCollection
/Mokka/init/lcioDetailedTRKHitMode VXDCollection
/Mokka/init/lcioDetailedTRKHitMode FTD_PIXELCollection
/Mokka/init/lcioDetailedTRKHitMode FTD_STRIPCollection
/Mokka/init/lcioDetailedTRKHitMode TPCCollection
/Mokka/init/lcioDetailedTRKHitMode TPCSpacePointCollection

/Mokka/init/physicsListName QGSP_BERT
/Mokka/init/rangeCut 0.1 mm

#/Mokka/init/TPCLowPtStepLimit true
#/Mokka/init/TPCLowPtCut 10 MeV
#/Mokka/init/TPCLowPtStoreMCPForHits true
'''

Data2_Steer = '''
# no user interaction
/Mokka/init/visumode false
/Mokka/init/BatchMode true
'''

for Num_Steer in range(Batch_NUM):
	Data_Steer = Data1_Steer
	if Stdhepon_g4:
		Data_Steer += '/Mokka/init/lcioFilename data/' + StdhepName_g4macro.replace('.g4', 'slcio')
	else:
		Data_Steer += '/Mokka/init/lcioFilename data/' + Name_g4macro.replace('.g4', 'slcio') + '\n'
	RandomSeed_Steer = str(random.randint(0, 999999))
	McRunNumber_Steer = RandomSeed_Steer
	Data_Steer += '/Mokka/init/randomSeed ' + RandomSeed_Steer + '\n'
	Data_Steer += '/Mokka/init/mcRunNumber ' + RandomSeed_Steer + '\n'
	if Stdhepon_g4:
		Data_Steer += '/Mokka/init/initialMacroFile ' + StdhepName_g4macro
		NameNum_Steer = StdhepName_g4.replace('00', str(Num_Steer).zfill(2)) + Name_Steer
	else:
		Data_Steer += '/Mokka/init/initialMacroFile ' + Name_g4macro
		NameNum_Steer = Particle_g4 +  '_' + EnegyValue_g4 + EnegyUnit_g4 + '_' + str(Num_Steer).zfill(2) + Name_Steer
	File_Make(NameNum_Steer, Data_Steer)