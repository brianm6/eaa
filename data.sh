#!/bin/bash


# bashman () { man bash | less -p "^       $1 "; }


# week 3 lab b
# chmod 700 week3.sh to make this script only executable by the current user

# moved the postional parameter into the printf string

USR=$USER

if [ $# -gt 1 ]
then
  printf "Hello, $1!\n"
  USR=$1
else
  printf "Hello user $USR"
if

echo "Please type your birth month followed by [ENTER]:"

read MONTH

echo "Please input your favourite colour followed by [ENTER]:"

read COLOUR

printf "Hello $USR you where born in $MONTH and your favorite colour is $COLOUR\n"




