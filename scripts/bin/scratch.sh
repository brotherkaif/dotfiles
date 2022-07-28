#!/bin/bash

scratchpadsDir=$HOME/scratchpads
noteFilePath="$scratchpadsDir/$(date +%Y-%m-%d).md"

if [[ ! -f $noteFilePath ]]
then
  echo "# Notes for $(date +%Y-%m-%d)" > $noteFilePath
fi

nvim -c "norm Go" \
  -c "norm Go## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilePath
