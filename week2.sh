#!/bin/bash

# chmod 777 week2.sh to make executable
# ./week2.sh to run

# store the number of process

# into variable cnt

# ps list processes
# -ef params 
# e=list all processes, 
# f=full format
# | pipe output of command before | as paramter of command after the pipe

# wc could input
# -l paramter=count new lines
dt=`date '+%d/%m/%Y/%H:%M:%S'`

cnt=`ps -aux | grep -v root | wc -l`

#
# bash integer equality operator
#

# $cnt is accessing the variable cnt
# $1 is the first parameter of this scirpt


if ! [ -d "$HOME/logs/" ]
then
  mkdir "$HOME/logs/"
fi


if [ "$cnt" -gt "$1" ];
then
  if ! [ -f "$HOME/logs/wk2.log" ]
  then
    echo "Log started $dt" >> $HOME/logs/wk2.log
  fi
  echo "[$dt] Max number of non-root ($1) processes exceeded" >> $HOME/logs/wk2.log
fi
