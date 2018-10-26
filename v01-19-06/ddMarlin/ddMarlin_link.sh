#!/bin/bash

DataDIR="$HOME/group-folder/"`pwd`"/data"
mkdir -p $DataDIR
ln -s $DataDIR data
ls -lt data
