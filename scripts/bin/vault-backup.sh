#!/bin/bash

# set SRC to the root of the directory to backup
SRC="$HOME/commonplace"

# set DST to the path where you want your backups saved
DST="$HOME/commonplace-backups"

# set ZIP to the name of the zipped archive
ZIP="commonplace-backup-$(date +%Y-%m-%d).zip"

# create the $DST directory if it doesn't already exist
mkdir -p $DST

# move into the $SRC directory
cd $SRC

# create the zip file of the commonplace directory
zip -r $DST/$ZIP .

# move back to the directory you executed the script from
cd -
