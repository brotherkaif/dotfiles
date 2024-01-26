#!/bin/bash

SCRATCHPADS_DIR=$HOME/scratchpads
NOTE_FILE_PATH="$SCRATCHPADS_DIR/1$(date +%Y%m%d).md"

if [[ ! -f $NOTE_FILE_PATH ]]; then
	echo "# 1$(date +%Y%m%d)" >$NOTE_FILE_PATH
fi

nvim -c "norm Go" \
	-c "norm Go## $(date +%H:%M)" \
	-c "norm G2o" \
	-c "norm zz" \
	-c "startinsert" $NOTE_FILE_PATH
