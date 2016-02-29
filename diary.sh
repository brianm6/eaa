#!/bin/bash

# diary entry script

echo "Please type a diary entry followed by [ENTER]:"

read ENTRY


if [ -z $ENTRY ]
then
  echo "Diary entry was empty not saving to file"
else
  if ! [ -d $HOME/logs ]
  then
    echo "$HOME/logs directory does not exist, creating now"
    mkdir $HOME/logs
  else
    if [ -w $HOME/logs ]
    then
      echo "OK TO WRITE DIR"
	  # Could also check write permissions with if [ -w $HOME/logs/diary.txt ]
      if [ -w $HOME/logs/diary.txt ]
      then
        echo "OK TO WRITE FILE"
        echo `date` >> " " >> $ENTRY >> $HOME/logs/diary.txt
        echo "::::::::::::::::::Reading file::::::::::::::::::::"
        tail $HOME/logs/diary.txt         
      else
        echo "Missing file permission(s)"
      fi
    else 
      echo "Missing directory permission(s)"
    fi
  fi  
fi
