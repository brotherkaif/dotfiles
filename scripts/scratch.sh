#!/bin/bash

scratchpadsDir=$HOME/scratchpads
noteFilePath="$scratchpadsDir/$(date +%Y-%m-%d).md"

if [[ ! -f $noteFilePath ]]; then
	echo "# $(date +%Y-%m-%d) Daily Log" >$noteFilePath
	echo "## Tasks" >$noteFilePath
	echo "- [ ] " >$noteFilePath
	echo "" >$noteFilePath
	echo "## Events" >$noteFilePath
	echo "- " >$noteFilePath
	echo "" >$noteFilePath
	echo "## Notes" >$noteFilePath
	echo "" >$noteFilePath
fi

nvim -c "norm Go" \
	-c "norm Go## $(date +%H:%M)" \
	-c "norm G2o" \
	-c "norm zz" \
	-c "startinsert" $noteFilePath
