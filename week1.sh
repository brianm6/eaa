#!/bin/bash

# chmod u+x week1.sh to make executable
# ./week1.sh to run

more /proc/cpuinfo | grep process | wc -l

# store the number of process

# into variable cnt

# ps list processes
# -ef params 
# e=list all processes, 
# f=full format
# | pipe output of command before | as paramter of command after the pipe

# wc could input
# -l paramter=count new lines

cnt=`ps -ef | wc -l`

#
# bash integer equality operator
#

# $cnt is accessing the variable cnt
# $1 is the first parameter of this scirpt

if [ "$cnt" -gt "$1" ];
then
  echo "number of processes exceeded"
fi
