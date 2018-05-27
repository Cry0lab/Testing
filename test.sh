#!/bin/bash

validIP()
{
I=$IP

#if [ "$(ipcalc -cs $I && echo 1 || echo 0)" == 0 ]; then
#echo "That is not a valid IP Address. Please enter a valid IP Address:"
#read IP
#validIP
#return 0
#fi

if [[ $I !=~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "failure"
  read IP
  validIP
  return 0
fi

if [ "$(isAlive $I)" == "1" ] && [ "$I" != "$DHCP_IP" ]; then
 echo "That IP ADDRESS is already in use. Please enter a different one:"
 read IP
 validIP
 return 0
fi


}
