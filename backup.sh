#!/bin/bash

# backup untility (backup folder $HOME/eaa/Week4)
# * * * * * /$HOME/eaa/Week4/backup.sh

if [ ! -d $HOME/eaa/Week4 ]
then
  echo "$HOME/eaa/Week4 does not exist, now aborting"
else
  if [ ! -d $HOME/backups ]
  then
    mkdir $HOME/backups
  fi
  fname="`date +%Y-%m-%d%--%H:%M:%S`-backup.tar.gz"
  tar -cvzf $HOME/backups/$fname $HOME/eaa/Week4
fi