#!/bin/bash
#
# Example to run Mokka, using mysql dump file.
# 

softdir=/sw/ilc/ilcsoft
ilcsoftdir=${softdir}/cvmfs/x86_64_gcc44_sl6/v01-17-11
ildconfigdir=${softdir}/cvmfs/ILDConfig/v01-17-11-p02

. ${ilcsoftdir}/init_ilcsoft.sh

gcc --version
ls ${ildconfigdir}

MokkaDBConfig=${ildconfigdir}/MokkaDBConfig
export MOKKA_DUMP_FILE=${MokkaDBConfig}/mokka-dbdump.sql.tgz
export MOKKA_TMP_DIR=/tmp/mokka-$(date +%F--%H-%M-%S)-$$
mkdir -p ${MOKKA_TMP_DIR}
export MSG_LOG_FILE=`pwd`/last-mokka-run-$(date +%F--%H-%M-%S)-$$.log

StandardConfig=${ildconfigdir}/StandardConfig/current
ln -sf ${StandardConfig}/particle.tbl .

# Start Mokka here
#${MokkaDBConfig}/scripts/mokka-wrapper.sh  -M ILD_o1_v05 mokka.steer
${MokkaDBConfig}/scripts/mokka-wrapper.sh mokka.steer

