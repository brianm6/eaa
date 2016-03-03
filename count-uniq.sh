#!/bin/bash

# Count unique file types in a given directory passed in via argument

if [ $# -lt 2 ]
then
  file -b $1/* | cut -c1-14 | sort | uniq -c
else
  echo "Please provide one parameter which is the directory to scan"
fi
