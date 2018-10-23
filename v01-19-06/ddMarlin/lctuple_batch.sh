#!/bin/bash

bsub -q s -o bsub.log -J lctu_dM "(sh lctuple_run.sh > logs/ddMarlin_lctuple.log 2>&1)"
