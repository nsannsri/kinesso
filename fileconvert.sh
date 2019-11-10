#!/bin/bash

# This is basic conversion file only

# it should be like this  "sh fileconvert.sh -i templatefile -o outputfile"

# No proper  error handler included

# Checking for four arguments , first argumnet should be "-i" and second argumnet is file and thrid argumnet should be "-o"
# And Input and output file name should be different
if [[ "$#" -eq "4" && "$1" == "-i" && "$3" == "-o" && "$2" != "$4" ]]
then
# Checking json file 
 if [ -f "$2" ]
 then
  str1="{{ ENVIRONMENT }}"
  str2="{{ SERVICE_NAME }}"
# Checking varilables not null
  if [[ -z "$ENVIRONMENT" || -z "$SERVICE_NAME" ]]
  then
   echo "Some of varibles are null"
   exit 1
  else
   sed  "s/$str1/$ENVIRONMENT/g" $2 > $4
   sed -i "s/$str2/$SERVICE_NAME/g" $4
  fi
 else
  echo "Template file not found"
  exit 1
 fi
else
echo "please Input proper format"
exit 1
fi


