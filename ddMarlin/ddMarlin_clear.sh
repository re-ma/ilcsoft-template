#!/bin/bash

rm bsub.log
rm -r logs
rm  data/*
rm -r data

rm $ILDConfig_DIR/MarlinStdReco.xml
rm Config/*
rm -r Config
rm HighLevelReco/*
rm -r HighLevelReco
rm PandoraSettings/*
rm -r PandoraSettings
rm ParticleFlow/*
rm -r ParticleFlow
rm Tracking/*
rm -r Tracking
rm MarlinStdRecoLCTuple.xml

rm MarlinStdRecoParsed*.xml
