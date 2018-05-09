#!/bin/bash

bsub -q s -o batch.log "sh dd4gun_dd4hep.sh"
