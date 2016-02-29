# check and set script file and parent directory permissions for rwx for current user only

PERMISSIONS=($(ls -l *.sh | cut -d ' ' -f1))

SCRIPTSNUM=`ls -l *.sh | wc -l | sed 's/^ *//g' | sed 's/ $*//g'`
echo "Number of .sh script files: $SCRIPTSNUM"

#SCRIPTS=($(ls -l *.sh | cut -d ' ' -f12))

# modified to prefent error when a new file (touch) is created with zero bytes
# cut will see the 0 as a null string and cut out the wrong field -f12 minus 1 = -f 11 (month)
# not desired effect so reverse then the cut at -f1 and reverse agagin

SCRIPTS=($(ls -l *.sh | rev | cut -d ' ' -f1 | rev))

#echo ${SCRIPTS[*]}

for (( i=0; i<$SCRIPTSNUM; i++ ))
do
  # can also be done with if [ -w ${SCRIPTS[i]} ]
  if [ ! ${PERMISSIONS[i]} = "-rwx------" ]
  then
    echo ${PERMISSIONS[i]} ${SCRIPTS[i]} " has wrong permissions resetting to rwx (700) for $USER"
    chmod 700 ${SCRIPTS[i]}
  else
    echo "${PERMISSIONS[i]} Correct permissions found for ${SCRIPTS[i]} script for $USER"
  fi
done

DIRPERMISSIONS=`ls -l -d | cut -d ' ' -f1`

# can also be done with if [ -w DIRPERMISSIONS ]
if [ ! $DIRPERMISSIONS = "drwx------" ]
then
  echo "($DIRPERMISSIONS) Directory `pwd` has wrong permission resetting to drwx (700) for $USER"
  chmod 700 `pwd`
else
  echo "($DIRPERMISSIONS) Correct permissions found for directory `pwd` for $USER"
fi
