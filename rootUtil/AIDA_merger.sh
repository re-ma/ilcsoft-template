#!/bin/bash

source /home/ilc/reima/init/root_init.sh

FNPrefix=${1}

$ROOTSYS/bin/hadd data/${FNPrefix}all.root \
data/${FNPrefix}01.root \
data/${FNPrefix}02.root \
data/${FNPrefix}03.root \
data/${FNPrefix}04.root \
data/${FNPrefix}05.root \
data/${FNPrefix}06.root \
data/${FNPrefix}07.root \
data/${FNPrefix}08.root \
data/${FNPrefix}09.root \
data/${FNPrefix}10.root 
